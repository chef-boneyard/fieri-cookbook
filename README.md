# Fieri

This cookbook deploys the [Fieri](https://github.com/opscode/fieri) application.

## Data Bag Structure

Looks for a data bag names 'apps' with an item in it matching the
node['fieri']['data_bag'] attribute. It expects that data bag to have the
following format:


auth_token:           ....
foodcritic_fail_tags: any
results_endpoint:     https://supermarket.chef.io/api/v1/cookbook-verisons/evaluation
sentry_url:           https:...