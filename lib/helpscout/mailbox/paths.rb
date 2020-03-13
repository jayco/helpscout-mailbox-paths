# frozen_string_literal: true

require 'helpscout/mailbox/paths/version'

module Helpscout
  module Mailbox
    module Paths
      class Error < StandardError; end

      PATH_MAP = {
        v2_conversations_create: ['POST', '/v2/conversations'].freeze,
        v2_conversations: ['GET', '/v2/conversations'].freeze,
        v2_conversations_delete: ['DELETE', '/v2/conversations/%{conversation_id}'].freeze,
        v2_conversation: ['GET', '/v2/conversations/%{conversation_id}'].freeze,
        v2_conversations_update: ['PATCH', '/v2/conversations/%{conversation_id}'].freeze,

        v2_conversations_attachment_delete: ['DELETE', '/v2/conversations/%{conversation_id}/attachments/%{attachment_id}'].freeze,
        v2_conversations_attachment: ['GET', '/v2/conversations/%{conversation_id}/attachments/%{attachment_id}/data'].freeze,
        v2_conversations_attachment_create: ['POST', '/v2/conversations/%{conversation_id}/threads/%{thread_id}/attachments'].freeze,

        v2_conversations_fields_update: ['PUT', '/v2/conversations/%{conversation_id}/fields'].freeze,
        v2_conversations_tags_update: ['PUT', '/v2/conversations/%{conversation_id}/tags'].freeze,

        v2_conversations_chat_create: ['POST', '/v2/conversations/%{conversation_id}/chats'].freeze,
        v2_conversations_note_create: ['POST', '/v2/conversations/%{conversation_id}/notes'].freeze,
        v2_conversations_phone_create: ['POST', '/v2/conversations/%{conversation_id}/phones'].freeze,
        v2_conversations_reply_create: ['POST', '/v2/conversations/%{conversation_id}/reply'].freeze,

        v2_conversations_original_source: ['GET', '/v2/conversations/%{conversation_id}/threads/%{thread_id}/original-source'].freeze,

        v2_conversations_thread_create: ['POST', '/v2/conversations/%{conversation_id}/customer'].freeze,
        v2_conversations_thread_list: ['GET', '/v2/conversations/%{conversation_id}/threads'].freeze,
        v2_conversations_thread_update: ['PATCH', '/v2/conversations/%{conversation_id}/threads/%{thread_id}'].freeze,

        v2_conversations_customer_properties: ['GET', '/v2/customer-properties'].freeze,

        v2_customers: ['GET', '/v2/customers'].freeze,
        v2_customers_create: ['POST', '/v2/customers'].freeze,
        v2_customer: ['GET', '/v2/customers/%{customer_id}'].freeze,
        v2_customers_overwrite: ['PUT', '/v2/customers/%{customer_id}'].freeze,
        v2_customers_update: ['PATCH', '/v2/customers/%{customer_id}'].freeze,

        v2_customers_address_create: ['POST', '/v2/customers/%{customer_id}/address'].freeze,
        v2_customers_address_delete: ['DELETE', '/v2/customers/%{customer_id}/address'].freeze,
        v2_customers_address: ['GET', '/v2/customers/%{customer_id}/address'].freeze,
        v2_customers_address_update: ['PATCH', '/v2/customers/%{customer_id}/address'].freeze,

        v2_customers_chats: ['GET', '/v2/customers/%{customer_id}/chats'].freeze,
        v2_customers_chats_create: ['POST', '/v2/customers/%{customer_id}/chats/%{chat_id}'].freeze,
        v2_customers_chats_update: ['PUT', '/v2/customers/%{customer_id}/chats/%{chat_id}'].freeze,

        v2_customers_emails_create: ['POST', '/v2/customers/%{customer_id}/emails'].freeze,
        v2_customers_emails: ['GET', '/v2/customers/%{customer_id}/emails'].freeze,
        v2_customers_emails_update: ['PUT', '/v2/customers/%{customer_id}/emails/%{email_id}'].freeze,
        v2_customers_emails_delete: ['DELETE', '/v2/customers/%{customer_id}/emails/%{email_id}'].freeze,

        v2_customers_phones_create: ['POST', '/v2/customers/%{customer_id}/phones'].freeze,
        v2_customers_phones: ['GET', '/v2/customers/%{customer_id}/phones'].freeze,
        v2_customers_phones_update: ['PUT', '/v2/customers/%{customer_id}/phones/%{phone_id}'].freeze,
        v2_customers_phones_delete: ['DELETE', '/v2/customers/%{customer_id}/phones/%{phone_id}'].freeze,

        v2_customers_social_create: ['POST', '/v2/customers/%{customer_id}/social-profiles'].freeze,
        v2_customers_social: ['GET', '/v2/customers/%{customer_id}/social-profiles'].freeze,
        v2_customers_social_update: ['PUT', '/v2/customers/%{customer_id}/social-profiles/%{profile_id}'].freeze,
        v2_customers_social_delete: ['DELETE', '/v2/customers/%{customer_id}/social-profiles/%{profile_id}'].freeze,

        v2_customers_website_create: ['POST', '/v2/customers/%{customer_id}/websites'].freeze,
        v2_customers_website: ['GET', '/v2/customers/%{customer_id}/websites'].freeze,
        v2_customers_website_update: ['PUT', '/v2/customers/%{customer_id}/websites/%{website_id}'].freeze,
        v2_customers_website_delete: ['DELETE', '/v2/customers/%{customer_id}/websites/%{website_id}'].freeze,

        v2_customers_properties_update: ['PATCH', '/v2/customers/%{customer_id}/properties'].freeze,

        v2_mailboxes: ['GET', '/v2/mailboxes'].freeze,
        v2_mailbox: ['GET', '/v2/mailboxes/%{mailbox_id}'].freeze,
        v2_mailbox_fields: ['GET', '/v2/mailboxes/%{mailbox_id}/fields'].freeze,
        v2_mailbox_folders: ['GET', '/v2/mailboxes/%{mailbox_id}/folders'].freeze,

        v2_ratings: ['GET', '/v2/ratings/%{rating_id}'].freeze,

        v2_reports_company: ['GET', '/v2/reports/company'].freeze,
        v2_reports_company_customers_helped: ['GET', '/v2/reports/company/customers-helped'].freeze,
        v2_reports_company_drilldown: ['GET', '/v2/reports/company/drilldown'].freeze,

        v2_reports_conversations: ['GET', '/v2/reports/conversations'].freeze,
        v2_reports_conversations_new: ['GET', '/v2/reports/conversations/new'].freeze,
        v2_reports_conversations_channel_volume: ['GET', '/v2/reports/conversations/volume-by-channel'].freeze,
        v2_reports_conversations_busy_times: ['GET', '/v2/reports/conversations/busy-times'].freeze,
        v2_reports_conversations_drilldown: ['GET', '/v2/reports/conversations/drilldown'].freeze,
        v2_reports_conversations_new_drilldown: ['GET', '/v2/reports/conversations/new-drilldown'].freeze,
        v2_reports_conversations_fields_drilldown: ['GET', '/v2/reports/conversations/fields-drilldown'].freeze,
        v2_reports_conversations_messages_received: ['GET', '/v2/reports/conversations/received-messages'].freeze,

        v2_reports_docs: ['GET', '/v2/reports/docs'].freeze,

        v2_reports_happiness: ['GET', '/v2/reports/happiness'].freeze,
        v2_reports_happiness_ratings: ['GET', '/v2/reports/happiness/ratings'].freeze,

        v2_reports_productivity: ['GET', '/v2/reports/productivity'].freeze,
        v2_reports_productivity_first_response_times: ['GET', '/v2/reports/productivity/first-response-time'].freeze,
        v2_reports_productivity_replies: ['GET', '/v2/reports/productivity/replies-sent'].freeze,
        v2_reports_productivity_resolutions_times: ['GET', '/v2/reports/productivity/resolution-time'].freeze,
        v2_reports_productivity_resolved: ['GET', '/v2/reports/productivity/resolved'].freeze,
        v2_reports_productivity_response_times: ['GET', '/v2/reports/productivity/response-time'].freeze,

        v2_reports_user: ['GET', '/v2/reports/user'].freeze,
        v2_reports_user_conversation_history: ['GET', '/v2/reports/user/conversation-history'].freeze,
        v2_reports_user_customers_helped: ['GET', '/v2/reports/user/customers-helped'].freeze,
        v2_reports_user_happiness: ['GET', '/v2/reports/user/happiness'].freeze,
        v2_reports_user_ratings: ['GET', '/v2/reports/user/ratings'].freeze,
        v2_reports_user_replies: ['GET', '/v2/reports/user/replies'].freeze,
        v2_reports_user_resolutions: ['GET', '/v2/reports/user/resolutions'].freeze,
        v2_reports_user_drilldown: ['GET', '/v2/reports/user/drilldown'].freeze,

        v2_reports_chat: ['GET', '/v2/reports/chat'].freeze,
        v2_reports_email: ['GET', '/v2/reports/email'].freeze,
        v2_reports_phone: ['GET', '/v2/reports/phone'].freeze,

        v2_tags: ['GET', '/v2/tags'].freeze,

        v2_teams: ['GET', '/v2/teams'].freeze,
        v2_teams_members: ['GET', '/v2/teams/%{team_id}/members'].freeze,

        v2_users: ['GET', '/v2/users'].freeze,
        v2_me: ['GET', '/v2/users/me'].freeze,
        v2_user: ['GET', '/v2/users/%{user_id}'].freeze,

        v2_webhooks_create: ['POST', '/v2/webhooks'].freeze,
        v2_webhooks: ['GET', '/v2/webhooks'].freeze,
        v2_webhook: ['GET', '/v2/webhooks/%{webhook_id}'].freeze,
        v2_webhooks_update: ['PUT', '/v2/webhooks/%{webhook_id}'].freeze,
        v2_webhooks_delete: ['DELETE', '/v2/webhooks/%{webhook_id}'].freeze,

        v2_workflows: ['GET', '/v2/workflows'].freeze,
        v2_workflows_run: ['POST', '/v2/workflows/%{workflow_id}/run'].freeze,
        v2_workflows_update: ['PATCH', '/v2/workflows/%{workflow_id}'].freeze
      }.freeze

      def generate_path(path, values)
        template = PATH_MAP[path]
        raise "path '#{path}' not found" if template.nil?

        { method: template.first, path: template.last % values }
      end
    end
  end
end
