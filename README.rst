########
LiffyBot
########

*An IRC Bot in Lisp Flavored Erlang*

.. image:: images/LiffyBot-small-3.png


Introduction
============

LiffyBot is not really a seriosu endeavor, more of a nod to the stereotypical
IRC-bot-as-first-project thing than anything else. To be honest, though, the
original impetus *was* a real use case: #erlang-lisp on IRC needed a bot.

``*shrugs*``

A quick scan of the github Erlang bot-space indicated that perhaps `erlbot`_
was a good starting place. We'll try to make our way through that code, porting
it to LFE and, maybe some day, running it in our Freenode channel ;-)

``└[∵┌]└[ ∵ ]┘[┐∵]┘``

But maybe not.

``┗[© ♒ ©]┛ ︵ ┻━┻``


Dependencies
------------

This project assumes that you have `rebar`_ installed somwhere in your
``$PATH``.

This project depends upon the following, which installed to the ``deps``
directory of this project when you run ``make deps``:

* `LFE`_ (Lisp Flavored Erlang; needed only to compile)
* `lfeunit`_ (needed only to run the unit tests)


Installation
============

Just add it to your ``rebar.config`` deps:

```erlang
    {deps, [
        ...
        {lfebot, ".*", {git, "git@github.com:lfe/lfebot.git", "master"}}
      ]}.
```

And then do the usual:

```bash

    $ rebar get-deps
    $ rebar compile
```


Usage
=====

Add content to me here!


.. Links
.. -----
.. _rebar: https://github.com/rebar/rebar
.. _LFE: https://github.com/rvirding/lfe
.. _lfeunit: https://github.com/lfe/lfeunit
.. _erlbot: https://github.com/npwolf/erlbot
