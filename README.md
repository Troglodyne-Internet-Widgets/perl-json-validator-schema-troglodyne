# NAME

JSON::Validator::Schema::Troglodyne - Troglodyne extensions to the OpenAPIv3 schema validator.

# VERSION

version 1.000

# JSON::Validator::Schema::Troglodyne

Troglodyne LLC's extensions to [JSON::Validator::Schema::OpenAPIv3](https://metacpan.org/pod/JSON%3A%3AValidator%3A%3ASchema%3A%3AOpenAPIv3).

There isn't a mechanism to inject validators into [JSON::Validator::Formats](https://metacpan.org/pod/JSON%3A%3AValidator%3A%3AFormats),
so here we are.

Relies entirely on the dynamic dispatch of validator methods via \_validate\_type\_\*name\* subs being called.
If that changes upstream, this module will break.

## TYPES

### email

Uses [Data::Validate::Email](https://metacpan.org/pod/Data%3A%3AValidate%3A%3AEmail)::is\_email() to validate your email field.

### callback

Signify that this data is a string describing a fully qualified perl subroutine.

# BUGS

Please report any bugs or feature requests on the bugtracker website
[https://github.com/teodesian/perl-json-validator-schema-troglodyne/issues](https://github.com/teodesian/perl-json-validator-schema-troglodyne/issues)

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

# AUTHORS

Current Maintainers:

- George S. Baugh <teodesian@gmail.com>

# COPYRIGHT AND LICENSE

Copyright (c) 2026 Troglodyne LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
