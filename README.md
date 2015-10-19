*Deprecated!!*

anisible-prj-tbb
================
This [Ansible](http://www.ansible.com) project helps to download and verify [Tor Browser Bundle](https://www.torproject.org/projects/torbrowser.html.en) (TBB) in GNU/Linux.

The idea is the same as [Tor Browser Launcher](https://github.com/micahflee/torbrowser-launcher) (see advice below).

Requirements
------------

Ansible 1.6 or higher.

Project variables
------------------

Add or modify the following variable in playbook.yml

Optional variables (not included in roles/ansible-role-tbb/defaults/main.yml):

* `tbb_older_dir`: path of an older version of TBB to import the bookmarks from. It will be used when `import_settings` variable is true (default). For instance:
    tbb_older_dir: /home/user/.tbb/tbb/tor-browser-linux32-3.6.1_en-US
* `tor_control_pw`: password for tor control port. It will be used when `use_system_tor` variale is true default)

Variables you might want to change (defined in roles/ansible-role-tbb/defaults/main.yml:

    # the user for which tbb will be installed
    tbb_user: user

    ## if tor is already running, this variable will download everything through Tor
    ## TODO: detect whether tor is already running
    use_tor: true

    ## to use the system tor instead of the tbb tor
    use_system_tor: true

    ## in case of running system tor with a different socks port to the default
    tor_socks_port: 9050
    ## in case of running system tor with a different control port to the default
    tor_control_port: 9051
    ## to create the hashed tor control password and modify torrc with it.
    ## it requires sudo password.
    configure_torrc: false

    ## to import some settings (currently bookmarks) from other tbb installation 
    import_settings: true

    ## to install the package dependencies. It will require sudo password
    ## If they are not already installed and this variable is false, everythinhg will fail
    install_deps: false
                                                                                
    ## to setup noscript                                                             
    setup_noscript: true 

    # the system architecture (23 or 64 bits)
    tbb_arch: 32
    # the tbb language
    tbb_lant: en-US



Dependencies
------------

This project requires (ansible-role-tbb)[ https://github.com/leewoboo/ansible-role-tbb]


Install in Debian/Ubuntu
-------------------------

    sudo apt-get install ansible
    git clone --recursive  https://github.com/leewoboo/ansible-prj-tbb

Run
----

    ansible-playbook playbook.yml -i hosts

or just

    ./run.sh

If `install_deps` variables is true, the `--ask-sudo-pass` will be neeed, to specify the sudo password.

To run only some tasks, specify the tags with the `--tags` option. You can see which tags are availabe looking at roles/ansible-role-tbb/tasks

License
-------

GPLv3

Author Information
------------------

Lee Woboo

Advice
---------

Unles you're looking to experiment, use something better mantained and reviewed as Torbrowser Launcher.
