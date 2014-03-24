########
LiffyBot
########

*An IRC Bot in Lisp Flavored Erlang*

.. image:: images/LiffyBot-small-3.png


Introduction
============

LiffyBot is not really a serious endeavor, more of a nod to the stereotypical
IRC-bot-as-first-project thing than anything else. To be honest, though, the
original impetus *was* a real use case: #erlang-lisp on IRC needed a bot.

``*shrugs*``

A quick scan of the github Erlang bot-space indicated that perhaps `erlbot`_
was a good starting place. We'll try to make our way through that code, porting
it to LFE and, maybe some day, running it in our Freenode channel ;-)

``└[∵┌]└[ ∵ ]┘[┐∵]┘``

But maybe not.

``┗[© ♒ ©]┛ ︵ ┻━┻``


Planned Features
----------------

* Channel logging.

* Meeting minutes/notes.

* Conversational silliness (Alice).

* Other crazy AI stuff. Because.


Dependencies
------------

This project assumes that you have `rebar`_ installed somwhere in your
``$PATH``.

This project depends upon the following, which are installed to the
``deps`` directory of this project when you run ``make deps``:

* `LFE`_ (Lisp Flavored Erlang; needed only to compile)
* `lfeunit`_ (needed only to run the unit tests)


Installation
============

Just add it to your ``rebar.config`` deps:

.. code:: erlang

    {deps, [
        ...
        {lfebot, ".*", {git, "git@github.com:lfe/lfebot.git", "master"}}
      ]}.


And then do the usual:

.. code:: bash

    $ rebar get-deps
    $ rebar compile


Usage
=====


Running
-------

If you'd like to run erl bot in dev mode (running in the foreground, logging
everything to ``stdout``), do the following (you'll need to compile first):

.. code:: bash

    $ make compile
    $ make dev

or

.. code:: bash

    $ made run


If you'd like to daemonize the process:

.. code:: bash

    $ make prod

or

.. code:: bash

    $ make daemon


Stopping
--------

If you're running in the foregrund, ``^C^C`` will bring you back to the OS
shell.

If you're running in daemonized mode:

.. code:: bash

    $ make stop



Configuring
-----------

TBD


Development
===========


Contributing Patches
--------------------

TBD


Creating Plugins
----------------

TBD



.. Links
.. -----
.. _rebar: https://github.com/rebar/rebar
.. _LFE: https://github.com/rvirding/lfe
.. _lfeunit: https://github.com/lfe/lfeunit
.. _erlbot: https://github.com/npwolf/erlbot
