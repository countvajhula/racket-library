Contributing
============

.. contents:: :depth: 2

Installing <project> Locally
--------------------------------------

<project> will be installed so that it is linked directly to the cloned instance of the Git repo on your local machine. It means that any changes you make there will be reflected in all code on your machine that depends on <project>. Likewise, updating <project> would just be a matter of ``git pull``.

Uninstall any version of <project> you already have
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

  raco pkg remove --force <project>

Install from source
^^^^^^^^^^^^^^^^^^^

After cloning the repo and changing to the repo directory:

.. code-block:: bash

  make install

Development Workflows
---------------------

Run ``make help`` or simply ``make`` to see all of the options here. The main ones are summarized below.

Dev Loop
~~~~~~~~

Rebuilding
^^^^^^^^^^

.. code-block:: bash

  make build

Running Tests
^^^^^^^^^^^^^

Run all tests
`````````````

.. code-block:: bash

  make test

Running Profilers
^^^^^^^^^^^^^^^^^

You'd typically only need these when you're optimizing performance in general or modifying the implementation of a particular feature.

Run all profilers
`````````````````

.. code-block:: bash

  make profile

Docs Loop
~~~~~~~~~

The docs are in Scribble files in ``scribblings/``. After making any additions or changes:

Rebuilding
^^^^^^^^^^

.. code-block:: bash

  make build-docs

Viewing Docs
^^^^^^^^^^^^

.. code-block:: bash

  make docs

Release Workflow (Steps for Maintainer)
---------------------------------------

Build package, docs, and check dependencies
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

  make build-all

Check dependencies
~~~~~~~~~~~~~~~~~~

.. code-block:: bash

  make check-deps

Cutting a New Release
~~~~~~~~~~~~~~~~~~~~~

Bump the version in info.rkt and make a fresh commit

.. code-block:: racket

  (define version "i.j.k") ; numbers corresponding to major.minor.patch

Tag the release commit

.. code-block:: bash

  git tag -n<NUM>  # list existing tags and annotations; if specified, NUM configures verbosity
  git tag -a <new version number> -m "<release message>"  # or leave out -m to enter it in Vim

Push the changes including the new tag to origin

.. code-block:: bash

  git push --follow-tags  # push new tag to remote
