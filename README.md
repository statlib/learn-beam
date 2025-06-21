# learn-beam
Learning material for Erlang, Elixir and the BEAM ecosystem


# Installation guide (Kali)
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

# Add to ~/.bashrc
# Elixir
export ELIXIR_HOME=/home/user/opt/elixir-otp-27
export PATH=$ELIXIR_HOME/bin:$PATH
iex
#Erlang/OTP 27 [erts-15.2.6] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit:ns]
#
#Interactive Elixir (1.18.4) - press Ctrl+C to exit (type h() ENTER for help)
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

## Books
* [The BEAM Book](https://blog.stenmans.org/theBeamBook/)
* [Concurrent Programming in Erlang](https://erlang.org/download/erlang-book-part1.pdf)
  
## Courses
* [Chalmers - Parallel FP (2018)](https://www.cse.chalmers.se/edu/course.2018/DAT280_Parallel_Functional_Programming/lectures.html)
* [Chalmers - Parallel FP (2015)](https://www.cse.chalmers.se/edu/year/2015/course/DAT280_Parallel_Functional_Programming/)
* [Chalmers - Parallel FP exam (2020)](https://www.chalmerstenta.nu/tenta/DAT280__-__Parallell__funktionell__programmering/20200820i.pdf)
* [Chalmers - Principles of Concurrent Programming (2024)](https://www.cse.chalmers.se/edu/year/2024/course/TDA384_LP1/)
* [Chalmers - Principles of Concurrent Programming (2021/22)](https://www.cse.chalmers.se/edu/course.2021/TDA384_LP1/)
* [Glasgow - Erlang tutorial](https://www.dcs.gla.ac.uk/~amirg/tutorial/erlang/)
* [KTH - Distributed Systems in Erlang](https://people.kth.se/~johanmon/dse.html)
* [Learn you some Erlang for good](https://learnyousomeerlang.com/content)

## Talks
* [Learning Erlang Socially Over the Internet](https://www.cs.kent.ac.uk/people/staff/sjt/TFPIE2017/TFPIE_2017/Slides/Adams.pdf)
* [Armstrong - Functions + Messages + Concurrency = Erlang](https://www.erlang-factory.com/upload/presentations/45/keynote_joearmstrong.pdf)
* [Williams - The true story about why we invented Erlang](https://www.erlang-factory.com/upload/presentations/416/MikeWilliams.pdf)
