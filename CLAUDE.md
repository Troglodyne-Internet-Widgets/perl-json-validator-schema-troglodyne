# CLAUDE.md

This file is the procedure for work in this repository.

`JSON::Validator::Schema::Troglodyne` adds the types `email` and `callback`,
and the keyword `x-errorMessage`, to the OpenAPI v3 validator of
`JSON::Validator`.  It is one module, `lib/JSON/Validator/Schema/Troglodyne.pm`,
with one test, `t/main.t`.

## Which skills, and when

The hooks of the perl-slop plugin hold you to the procedure.  They refuse an
edit to Perl until `perl-slop:reading-perl` is loaded.  They refuse a commit of
Perl until `data-perl`, `testing-perl` and `reviewing-perl` are loaded, each
one after the last commit.  A refusal names the skills that are missing.

Before you answer a question about the code, load `perl-slop:reading-perl`.
The hooks cannot see that case.

## Read the code before you change it

The module relies on the internals of `JSON::Validator`: the dynamic dispatch
of `_validate_type_*` subs, and the private `_validate` sub.  A line that looks
pointless is usually there because of a change upstream.  Read the commit
behind a line before you change it.

## Finishing a changeset

Apply the skills in this order: data-perl, testing-perl, then reviewing-perl
against the whole diff.  To load a skill is not to apply it.

Then run `podchecker` on each changed file.

Do not run `perltidy`, `perlcritic` or `perl -c` yourself.  Do not run the
tests to decide whether a change is ready to commit.  The pre-commit hook
tidies the Perl that you staged, runs perlcritic on it, and compiles it.  Then
it runs the tests that the commit can break.  If a step fails, the hook stops
the commit and prints the reason.  To see why a test failed, run that file with
`-v`:

    prove -v t/main.t

The hub installs the hooks in `git-hooks/`.  Do not install them again.

## Commits and pull requests

Make a branch.  Do not commit to `master`.

A commit message says what was wrong and why the change fixes it.  Write it in
prose and in the imperative mood.  The why goes in the message, not in a
comment.

When you say what you ran and what it printed, take the site-specific names out
of the quote.  This repository is public.  `perl-slop:information-security` has
the full rule.
