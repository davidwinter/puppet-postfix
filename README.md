# puppet-postfix

A simple setup of Postfix with the goal that it only handles sending email. Handy for your `php` scripts, and system services like `monit` and `cron`.

It doesn't include local mailboxes, and therefore no local delivery and isn't listening for incoming mail.

## Install

With librarian-puppet, add the following to your Puppetfile:

	mod 'postfix',
		:git => 'git://github.com/davidwinter/puppet-postfix.git'

Then run `librarian-puppet install`.

## Usage

	class { 'postfix': }

## Author

David Winter <i@djw.me>

## Licence

MIT
