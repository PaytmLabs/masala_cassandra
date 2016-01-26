# masala_cassandra

This is a component of the [masala toolkit](https://github.com/PaytmLabs/masala).

This is a [wrapper cookbook](http://blog.vialstudios.com/the-environment-cookbook-pattern/#thewrappercookbook) for providing recipes for cassandra server deployment. It will also allow setup of opscenter and the datastax agent. There is also a daily repair process setup via a cron job.

It will enable datadog monitoring for cassandra if enabled in masala_base.

## Supported Platforms

The platforms supported are:
- Centos 6.7+ / Centos 7.1+
- Ubuntu 14.04 LTS (And future LTS releases)
- Debioan 8.2+

## Attributes

Please see the documentation for the cookbooks included by masala_cassandra. (See [metadata.rb](https://github.com/PaytmLabs/masala_cassandra/blob/develop/metadata.rb) file)

This cookbook does not add any attributes of it's own.

## Usage

### masala_cassandra::default

Include `masala_cassandra` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[masala_cassandra::default]"
  ]
}
```

## License, authors, and how to contribute

See:
- [LICENSE](https://github.com/PaytmLabs/masala_cassandra/blob/develop/LICENSE)
- [MAINTAINERS.md](https://github.com/PaytmLabs/masala_cassandra/blob/develop/MAINTAINERS.md)
- [CONTRIBUTING.md](https://github.com/PaytmLabs/masala_cassandra/blob/develop/CONTRIBUTING.md)

