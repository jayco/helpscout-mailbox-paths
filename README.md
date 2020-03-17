# Helpscout::Mailbox::Paths

[![Build status](https://badge.buildkite.com/f19b143ad6bbb2fce71a361da78e974be4737e14d578d21b5d.svg)](https://buildkite.com/jayco/helpscout-mailbox-paths)[![Gem Version](https://badge.fury.io/rb/helpscout-mailbox-paths.svg)](https://badge.fury.io/rb/helpscout-mailbox-paths)

Simple gem mixin for generating helpscout paths with params

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'helpscout-mailbox-paths'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install helpscout-mailbox-paths

## Usage

## Helpscout::Mailbox::Paths.generate_path()

```ruby
require 'helpscout/mailbox/paths'

class SomeClient
    include Helpscout::Mailbox::Paths

    def send(method, path)
        # do some request stuffs...
    end
end

client = SomeClient.new

api = client.generate_path(:v2_conversation, {conversation_id: 1089909636})
# => {:method=>"GET", :path=>"/v2/conversations/1089909636"}

client.send(api[:method], api[:path])
```

## API Mapping

```ruby
PATH_MAP = {
    v2_conversations_create: ['POST', '/v2/conversations'],
    v2_conversations: ['GET', '/v2/conversations'],
    v2_conversations_delete: ['DELETE', '/v2/conversations/%{conversation_id}'],
    v2_conversation: ['GET', '/v2/conversations/%{conversation_id}'],
    v2_conversations_update: ['PATCH', '/v2/conversations/%{conversation_id}'],

    v2_conversations_attachment_delete: ['DELETE', '/v2/conversations/%{conversation_id}/attachments/%{attachment_id}'],
    v2_conversations_attachment: ['GET', '/v2/conversations/%{conversation_id}/attachments/%{attachment_id}/data'],
    v2_conversations_attachment_create: ['POST', '/v2/conversations/%{conversation_id}/threads/%{thread_id}/attachments'],

    v2_conversations_fields_update: ['PUT', '/v2/conversations/%{conversation_id}/fields'],
    v2_conversations_tags_update: ['PUT', '/v2/conversations/%{conversation_id}/tags'],

    v2_conversations_chat_create: ['POST', '/v2/conversations/%{conversation_id}/chats'],
    v2_conversations_note_create: ['POST', '/v2/conversations/%{conversation_id}/notes'],
    v2_conversations_phone_create: ['POST', '/v2/conversations/%{conversation_id}/phones'],
    v2_conversations_reply_create: ['POST', '/v2/conversations/%{conversation_id}/reply'],

    v2_conversations_original_source: ['GET', '/v2/conversations/%{conversation_id}/threads/%{thread_id}/original-source'],

    v2_conversations_thread_create: ['POST', '/v2/conversations/%{conversation_id}/customer'],
    v2_conversations_thread_list: ['GET', '/v2/conversations/%{conversation_id}/threads'],
    v2_conversations_thread_update: ['PATCH', '/v2/conversations/%{conversation_id}/threads/%{thread_id}'],

    v2_conversations_customer_properties: ['GET', '/v2/customer-properties'],

    v2_customers: ['GET', '/v2/customers'],
    v2_customers_create: ['POST', '/v2/customers'],
    v2_customer: ['GET', '/v2/customers/%{customer_id}'],
    v2_customers_overwrite: ['PUT', '/v2/customers/%{customer_id}'],
    v2_customers_update: ['PATCH', '/v2/customers/%{customer_id}'],

    v2_customers_address_create: ['POST', '/v2/customers/%{customer_id}/address'],
    v2_customers_address_delete: ['DELETE', '/v2/customers/%{customer_id}/address'],
    v2_customers_address: ['GET', '/v2/customers/%{customer_id}/address'],
    v2_customers_address_update: ['PATCH', '/v2/customers/%{customer_id}/address'],

    v2_customers_chats: ['GET', '/v2/customers/%{customer_id}/chats'],
    v2_customers_chats_create: ['POST', '/v2/customers/%{customer_id}/chats/%{chat_id}'],
    v2_customers_chats_update: ['PUT', '/v2/customers/%{customer_id}/chats/%{chat_id}'],

    v2_customers_emails_create: ['POST', '/v2/customers/%{customer_id}/emails'],
    v2_customers_emails: ['GET', '/v2/customers/%{customer_id}/emails'],
    v2_customers_emails_update: ['PUT', '/v2/customers/%{customer_id}/emails/%{email_id}'],
    v2_customers_emails_delete: ['DELETE', '/v2/customers/%{customer_id}/emails/%{email_id}'],

    v2_customers_phones_create: ['POST', '/v2/customers/%{customer_id}/phones'],
    v2_customers_phones: ['GET', '/v2/customers/%{customer_id}/phones'],
    v2_customers_phones_update: ['PUT', '/v2/customers/%{customer_id}/phones/%{phone_id}'],
    v2_customers_phones_delete: ['DELETE', '/v2/customers/%{customer_id}/phones/%{phone_id}'],

    v2_customers_social_create: ['POST', '/v2/customers/%{customer_id}/social-profiles'],
    v2_customers_social: ['GET', '/v2/customers/%{customer_id}/social-profiles'],
    v2_customers_social_update: ['PUT', '/v2/customers/%{customer_id}/social-profiles/%{profile_id}'],
    v2_customers_social_delete: ['DELETE', '/v2/customers/%{customer_id}/social-profiles/%{profile_id}'],

    v2_customers_website_create: ['POST', '/v2/customers/%{customer_id}/websites'],
    v2_customers_website: ['GET', '/v2/customers/%{customer_id}/websites'],
    v2_customers_website_update: ['PUT', '/v2/customers/%{customer_id}/websites/%{website_id}'],
    v2_customers_website_delete: ['DELETE', '/v2/customers/%{customer_id}/websites/%{website_id}'],

    v2_customers_properties_update: ['PATCH', '/v2/customers/%{customer_id}/properties'],

    v2_mailboxes: ['GET', '/v2/mailboxes'],
    v2_mailbox: ['GET', '/v2/mailboxes/%{mailbox_id}'],
    v2_mailbox_fields: ['GET', '/v2/mailboxes/%{mailbox_id}/fields'],
    v2_mailbox_folders: ['GET', '/v2/mailboxes/%{mailbox_id}/folders'],

    v2_ratings: ['GET', '/v2/ratings/%{rating_id}'],

    v2_reports_company: ['GET', '/v2/reports/company'],
    v2_reports_company_customers_helped: ['GET', '/v2/reports/company/customers-helped'],
    v2_reports_company_drilldown: ['GET', '/v2/reports/company/drilldown'],

    v2_reports_conversations: ['GET', '/v2/reports/conversations'],
    v2_reports_conversations_new: ['GET', '/v2/reports/conversations/new'],
    v2_reports_conversations_channel_volume: ['GET', '/v2/reports/conversations/volume-by-channel'],
    v2_reports_conversations_busy_times: ['GET', '/v2/reports/conversations/busy-times'],
    v2_reports_conversations_drilldown: ['GET', '/v2/reports/conversations/drilldown'],
    v2_reports_conversations_new_drilldown: ['GET', '/v2/reports/conversations/new-drilldown'],
    v2_reports_conversations_fields_drilldown: ['GET', '/v2/reports/conversations/fields-drilldown'],
    v2_reports_conversations_messages_received: ['GET', '/v2/reports/conversations/received-messages'],

    v2_reports_docs: ['GET', '/v2/reports/docs'],

    v2_reports_happiness: ['GET', '/v2/reports/happiness'],
    v2_reports_happiness_ratings: ['GET', '/v2/reports/happiness/ratings'],

    v2_reports_productivity: ['GET', '/v2/reports/productivity'],
    v2_reports_productivity_first_response_times: ['GET', '/v2/reports/productivity/first-response-time'],
    v2_reports_productivity_replies: ['GET', '/v2/reports/productivity/replies-sent'],
    v2_reports_productivity_resolutions_times: ['GET', '/v2/reports/productivity/resolution-time'],
    v2_reports_productivity_resolved: ['GET', '/v2/reports/productivity/resolved'],
    v2_reports_productivity_response_times: ['GET', '/v2/reports/productivity/response-time'],

    v2_reports_user: ['GET', '/v2/reports/user'],
    v2_reports_user_conversation_history: ['GET', '/v2/reports/user/conversation-history'],
    v2_reports_user_customers_helped: ['GET', '/v2/reports/user/customers-helped'],
    v2_reports_user_happiness: ['GET', '/v2/reports/user/happiness'],
    v2_reports_user_ratings: ['GET', '/v2/reports/user/ratings'],
    v2_reports_user_replies: ['GET', '/v2/reports/user/replies'],
    v2_reports_user_resolutions: ['GET', '/v2/reports/user/resolutions'],
    v2_reports_user_drilldown: ['GET', '/v2/reports/user/drilldown'],

    v2_reports_chat: ['GET', '/v2/reports/chat'],
    v2_reports_email: ['GET', '/v2/reports/email'],
    v2_reports_phone: ['GET', '/v2/reports/phone'],

    v2_tags: ['GET', '/v2/tags'],

    v2_teams: ['GET', '/v2/teams'],
    v2_teams_members: ['GET', '/v2/teams/%{team_id}/members'],

    v2_users: ['GET', '/v2/users'],
    v2_me: ['GET', '/v2/users/me'],
    v2_user: ['GET', '/v2/users/%{user_id}'],

    v2_webhooks_create: ['POST', '/v2/webhooks'],
    v2_webhooks: ['GET', '/v2/webhooks'],
    v2_webhook: ['GET', '/v2/webhooks/%{webhook_id}'],
    v2_webhooks_update: ['PUT', '/v2/webhooks/%{webhook_id}'],
    v2_webhooks_delete: ['DELETE', '/v2/webhooks/%{webhook_id}'],

    v2_workflows: ['GET', '/v2/workflows'],
    v2_workflows_run: ['POST', '/v2/workflows/%{workflow_id}/run'],
    v2_workflows_update: ['PATCH', '/v2/workflows/%{workflow_id}']
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jayco/helpscout-mailbox-paths. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Helpscout::Mailbox::Paths project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/helpscout-mailbox-paths/blob/master/CODE_OF_CONDUCT.md).
