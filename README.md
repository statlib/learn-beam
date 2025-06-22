# learn-beam
Learning material for Erlang, Elixir and the BEAM ecosystem


# Installation guide (WSL)

## Erlang and Elixir
```bash
# Download asdf v0.18.0 and place in ~/.local/bin
mkdir -p ~/opt
cd ~/opt
wget https://github.com/asdf-vm/asdf/releases/download/v0.18.0/asdf-v0.18.0-linux-amd64.tar.gz
tar -zxvf asdf-v0.18.0-linux-amd64.tar.gz
mv asdf ~/.local/bin

# Check that asdf is in $PATH
type -a asdf 
# asdf is /home/user/.local/bin/asdf

# Add shims directory to path. Add to .bash_profile.
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Install Erlang dependencies
sudo apt-get -y install build-essential autoconf m4 libncurses-dev libwxgtk3.2-dev libwxgtk-webview3.2-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils

# Install the latest version of erlang
# asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
# export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac" # Skip Java dependency
# asdf install erlang latest
# > autoconf: error: no input file
sudo apt-get install erlang

# Launch erl
# $ erl
# Erlang/OTP 27 [erts-15.2.6] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit:ns]
#
# Eshell V15.2.6 (press Ctrl+G to abort, type help(). for help)

# Install Elixir
cd ~/opt
wget https://github.com/elixir-lang/elixir/releases/download/v1.18.4/elixir-otp-27.zip
unzip elixir-otp-27.zip

# Add to ~/.bash_profile
# Elixir
export ELIXIR_HOME=/home/user/opt/elixir-otp-27
export PATH=$ELIXIR_HOME/bin:$PATH
iex
#Erlang/OTP 27 [erts-15.2.6] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit:ns]
#
#Interactive Elixir (1.18.4) - press Ctrl+C to exit (type h() ENTER for help)
```

## Livebook setup in WSL
```

sudo apt install erlang-inets erlang-os-mon erlang-runtime-tools erlang-ssl erlang-xmerl erlang-dev erlang-parsetools
mkdir -p ~/git
cd ~/git
git clone https://github.com/livebook-dev/livebook.git
cd livebook/
mix deps.get --only prod

# Add to ~/.bashrc
livebook() {
    # --- CONFIGURATION ---
    # On WSL, set the full path to your desired Windows browser executable
    local wsl_browser_path="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"
    # -------------------

    # Change to the correct directory
    cd ~/git/livebook/ || return

    # A flag to ensure we only open the URL once
    local opened=false

    # This function processes each line of output from the server
    open_when_ready() {
        while IFS= read -r line; do
            # Echo the line to the terminal so you see the server's output
            echo "$line"

            # Check if we haven't opened the browser yet and if the line contains a URL
            if ! $opened && [[ "$line" =~ (http://[^[:space:]]+) ]]; then
                # The regex above found a URL and bash stores it in BASH_REMATCH
                local url="${BASH_REMATCH[1]}"
                echo -e "\n[Helper] Found URL. Opening in browser...\n"
                echo $url

                # Use the correct command to open the URL based on the OS
                case "$(uname -s)" in
                    Linux*)
                        # Check if we are in Windows Subsystem for Linux
                        if grep -q -i "microsoft" /proc/version; then
                            # Use the specified browser path for WSL
                            # The final '&' runs the command in the background
                            "$wsl_browser_path" "$url" &>/dev/null &
                        else
                            # Standard Linux behavior
                            xdg-open "$url" &>/dev/null
                        fi
                        ;;
                    Darwin*) # macOS
                        open "$url"
                        ;;
                esac
                
                # Set the flag to true to prevent opening more tabs
                opened=true
            fi
        done
    }

    # Start the server, redirecting all its output (stdout and stderr)
    # into our 'open_when_ready' function to be processed.
    MIX_ENV=prod mix phx.server 2>&1 | open_when_ready
}

livebook
```

# Key figures

## Erlang
* Joe Armstrong
* Francesco Cesarini
* Erik Stenman
* Mike Williams
* Robert Virding

## Elixir
* Jose Valim

# Resources

## Official
* [Getting started](https://www.erlang.org/faq/getting_started)
* [Universities](https://www.erlang.org/faq/introduction#universities)

## Books
* [The BEAM Book](https://blog.stenmans.org/theBeamBook/)
* [Concurrent Programming in Erlang](https://erlang.org/download/erlang-book-part1.pdf)
  
## Courses
* [An Erlang Course](https://erlang.org/course/course.html)
* [BEAM Wisdoms](https://beam-wisdoms.clau.se/start.html)
* [Chalmers - Parallel FP (2018)](https://www.cse.chalmers.se/edu/course.2018/DAT280_Parallel_Functional_Programming/lectures.html)
* [Chalmers - Parallel FP (2015)](https://www.cse.chalmers.se/edu/year/2015/course/DAT280_Parallel_Functional_Programming/)
* [Chalmers - Parallel FP exam (2020)](https://www.chalmerstenta.nu/tenta/DAT280__-__Parallell__funktionell__programmering/20200820i.pdf)
* [Chalmers - Principles of Concurrent Programming (2024)](https://www.cse.chalmers.se/edu/year/2024/course/TDA384_LP1/)
* [Chalmers - Principles of Concurrent Programming (2021/22)](https://www.cse.chalmers.se/edu/course.2021/TDA384_LP1/)
* [Exercism - Erlang](https://exercism.org/tracks/erlang)
* [Exercism - Elixir](https://exercism.org/tracks/elixir)
* [Glasgow - Erlang tutorial](https://www.dcs.gla.ac.uk/~amirg/tutorial/erlang/)
* [Kent - Erlang Master Class](https://www.youtube.com/playlist?list=PLoJC20gNfC2hnIUbQtA79kHxL8-iw_I2w)
* [KTH - Distributed Systems in Erlang](https://people.kth.se/~johanmon/dse.html)
* [Learn you some Erlang for good](https://learnyousomeerlang.com/content)
* [The Pragmatic Studio - Elixir & OTP](https://pragmaticstudio.com/courses/elixir)

## Talks
* [Learning Erlang Socially Over the Internet](https://www.cs.kent.ac.uk/people/staff/sjt/TFPIE2017/TFPIE_2017/Slides/Adams.pdf)
* [Armstrong - Functions + Messages + Concurrency = Erlang](https://www.erlang-factory.com/upload/presentations/45/keynote_joearmstrong.pdf)
* [Williams - The true story about why we invented Erlang](https://www.erlang-factory.com/upload/presentations/416/MikeWilliams.pdf)
