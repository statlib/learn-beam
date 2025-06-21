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

# Add shims directory to path
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Install Erlang dependencies
sudo apt-get -y install build-essential autoconf m4 libncurses-dev libwxgtk3.2-dev libwxgtk-webview3.2-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils

# Install the latest version of erlang
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac" # Skip Java dependency
asdf install erlang latest
# OR: sudo apt-get install erlang
```


# Resources

## Books
* [The BEAM Book](https://blog.stenmans.org/theBeamBook/)

## Courses
* [Chalmers - Parallel FP (2018)](https://www.cse.chalmers.se/edu/course.2018/DAT280_Parallel_Functional_Programming/lectures.html)
* [Chalmers - Parallel FP (2015)](https://www.cse.chalmers.se/edu/year/2015/course/DAT280_Parallel_Functional_Programming/)
* [Chalmers - Parallel FP exam (2020)](https://www.chalmerstenta.nu/tenta/DAT280__-__Parallell__funktionell__programmering/20200820i.pdf)
* [Chalmers - Principles of Concurrent Programming (2021/22)]([Principles of Concurrent Programming](https://www.cse.chalmers.se/edu/course.2021/TDA384_LP1/files/lectures/))
* [Glasgow - Erlang tutorial](https://www.dcs.gla.ac.uk/~amirg/tutorial/erlang/)

## Talks
* [Learning Erlang Socially Over the Internet](https://www.cs.kent.ac.uk/people/staff/sjt/TFPIE2017/TFPIE_2017/Slides/Adams.pdf)
* [Armstrong - Functions + Messages + Concurrency = Erlang](https://www.erlang-factory.com/upload/presentations/45/keynote_joearmstrong.pdf)
* [Williams - The true story about why we invented Erlang](https://www.erlang-factory.com/upload/presentations/416/MikeWilliams.pdf)
