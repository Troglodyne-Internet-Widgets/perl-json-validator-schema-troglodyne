# NAME

JSON::Validator::Schema::Troglodyne - Troglodyne extensions to the OpenAPIv3 schema validator.

# VERSION

version 1.001

# JSON::Validator::Schema::Troglodyne

Troglodyne LLC's extensions to [JSON::Validator::Schema::OpenAPIv3](https://metacpan.org/pod/JSON%3A%3AValidator%3A%3ASchema%3A%3AOpenAPIv3).

There isn't a mechanism to inject validators into [JSON::Validator::Formats](https://metacpan.org/pod/JSON%3A%3AValidator%3A%3AFormats),
so here we are.

Relies entirely on the dynamic dispatch of validator methods via \_validate\_type\_\*name\* subs being called.

["x-errorMessage"](#x-errormessage) similarly uses the internal sub `_validate`, to override less than useful error messages.

If any of that changes upstream, this module will break.

## TYPES

### email

Uses [Data::Validate::Email](https://metacpan.org/pod/Data%3A%3AValidate%3A%3AEmail)::is\_email() to validate your email field.

### callback

Signify that this data is a string describing a fully qualified perl subroutine.

## KEYWORDS

### x-errorMessage

A hash of messages by the keyword that fails, as the keyword of the same name
in ajv-errors takes it.  When the data fails the schema that has it, at that
place in the data, the error has the message of that keyword in place of the
generic one of [JSON::Validator::Error](https://metacpan.org/pod/JSON%3A%3AValidator%3A%3AError):

```perl
{
    type             => 'object',
    minProperties    => 1,
    not              => { required => ['test'], maxProperties => 1 },
    'x-errorMessage' => {
        minProperties => 'names no packager',
        not           => 'names no packager, only a test',
    },
}
```

Under `additionalProperties`, that gives
`/ffmpeg: names no packager, only a test` for
`{ ffmpeg => { test => 'x' } }`, where JSON::Validator says
`Should not match.`

The message of `required` goes to the error of each missing property, whose
path is that of the property.  An error that a subschema gives deeper in the
data keeps its own message, and so does an error of a keyword that the hash
does not name.  OpenAPI v3 ignores the keywords that start with `x-`, so a
schema with this keyword is still a valid one.

# BUGS

Please report any bugs or feature requests on the bugtracker website
[https://github.com/Troglodyne-Internet-Widgets/perl-json-validator-schema-troglodyne/issues](https://github.com/Troglodyne-Internet-Widgets/perl-json-validator-schema-troglodyne/issues)

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

# AUTHORS

Current Maintainers:

- George S. Baugh <teodesian@gmail.com>

# CONTRIBUTOR

troglodyne-robot <trogbot@troglodyne.net>

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
