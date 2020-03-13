# frozen_string_literal: true

RSpec.describe Helpscout::Mailbox::Paths do
  id = 1
  class TestClass
    include Helpscout::Mailbox::Paths
  end

  act = TestClass.new

  it 'has a version number' do
    expect(Helpscout::Mailbox::Paths::VERSION).not_to be nil
  end

  it 'raises an error if path is not known' do
    expect do
      expect(act.generate_path(:some_path, nil)).to raise_error(RuntimeError)
    end.to raise_error(RuntimeError)
  end

  context '/v2/conversations' do
    it ':v2_conversations_create' do
      api = act.generate_path(:v2_conversations_create, nil)
      expect(api[:method]).to eql('POST')
      expect(api[:path]).to eql('/v2/conversations')
    end

    it ':v2_conversations' do
      api = act.generate_path(:v2_conversations, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/conversations')
    end

    it ':v2_conversations_delete' do
      api = act.generate_path(:v2_conversations_delete, { conversation_id: id })
      expect(api[:method]).to eql('DELETE')
      expect(api[:path]).to eql("/v2/conversations/#{id}")
    end

    it ':v2_conversation' do
      api = act.generate_path(:v2_conversation, { conversation_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/conversations/#{id}")
    end

    it ':v2_conversations_update' do
      api = act.generate_path(:v2_conversations_update, { conversation_id: id })
      expect(api[:method]).to eql('PATCH')
      expect(api[:path]).to eql("/v2/conversations/#{id}")
    end

    it ':v2_conversations_attachment_delete' do
      api = act.generate_path(:v2_conversations_attachment_delete, { conversation_id: id, attachment_id: id })
      expect(api[:method]).to eql('DELETE')
      expect(api[:path]).to eql("/v2/conversations/#{id}/attachments/#{id}")
    end

    it ':v2_conversations_attachment' do
      api = act.generate_path(:v2_conversations_attachment, { conversation_id: id, attachment_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/conversations/#{id}/attachments/#{id}/data")
    end

    it ':v2_conversations_attachment_create' do
      api = act.generate_path(:v2_conversations_attachment_create, { conversation_id: id, thread_id: id })
      expect(api[:method]).to eql('POST')
      expect(api[:path]).to eql("/v2/conversations/#{id}/threads/#{id}/attachments")
    end

    it ':v2_conversations_fields_update' do
      api = act.generate_path(:v2_conversations_fields_update, { conversation_id: id })
      expect(api[:method]).to eql('PUT')
      expect(api[:path]).to eql("/v2/conversations/#{id}/fields")
    end

    it ':v2_conversations_tags_update' do
      api = act.generate_path(:v2_conversations_tags_update, { conversation_id: id })
      expect(api[:method]).to eql('PUT')
      expect(api[:path]).to eql("/v2/conversations/#{id}/tags")
    end

    it ':v2_conversations_chat_create' do
      api = act.generate_path(:v2_conversations_chat_create, { conversation_id: id })
      expect(api[:method]).to eql('POST')
      expect(api[:path]).to eql("/v2/conversations/#{id}/chats")
    end

    it ':v2_conversations_note_create' do
      api = act.generate_path(:v2_conversations_note_create, { conversation_id: id })
      expect(api[:method]).to eql('POST')
      expect(api[:path]).to eql("/v2/conversations/#{id}/notes")
    end

    it ':v2_conversations_phone_create' do
      api = act.generate_path(:v2_conversations_phone_create, { conversation_id: id })
      expect(api[:method]).to eql('POST')
      expect(api[:path]).to eql("/v2/conversations/#{id}/phones")
    end

    it ':v2_conversations_reply_create' do
      api = act.generate_path(:v2_conversations_reply_create, { conversation_id: id })
      expect(api[:method]).to eql('POST')
      expect(api[:path]).to eql("/v2/conversations/#{id}/reply")
    end

    it ':v2_conversations_original_source' do
      api = act.generate_path(:v2_conversations_original_source, { conversation_id: id, thread_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/conversations/#{id}/threads/#{id}/original-source")
    end

    it ':v2_conversations_thread_update' do
      api = act.generate_path(:v2_conversations_thread_update, { conversation_id: id, thread_id: id })
      expect(api[:method]).to eql('PATCH')
      expect(api[:path]).to eql("/v2/conversations/#{id}/threads/#{id}")
    end

    it ':v2_conversations_thread_create' do
      api = act.generate_path(:v2_conversations_thread_create, { conversation_id: id })
      expect(api[:method]).to eql('POST')
      expect(api[:path]).to eql("/v2/conversations/#{id}/customer")
    end

    it ':v2_conversations_thread_list' do
      api = act.generate_path(:v2_conversations_thread_list, { conversation_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/conversations/#{id}/threads")
    end
  end

  context '/v2/customer-properties' do
    it ':v2_conversations_customer_properties' do
      api = act.generate_path(:v2_conversations_customer_properties, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/customer-properties')
    end
  end

  context '/v2/customers' do
    it ':v2_customers' do
      api = act.generate_path(:v2_customers, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/customers')
    end

    it ':v2_customers_create' do
      api = act.generate_path(:v2_customers_create, nil)
      expect(api[:method]).to eql('POST')
      expect(api[:path]).to eql('/v2/customers')
    end

    it ':v2_customer' do
      api = act.generate_path(:v2_customer, { customer_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/customers/#{id}")
    end

    it ':v2_customers_overwrite' do
      api = act.generate_path(:v2_customers_overwrite, { customer_id: id })
      expect(api[:method]).to eql('PUT')
      expect(api[:path]).to eql("/v2/customers/#{id}")
    end

    it ':v2_customers_update' do
      api = act.generate_path(:v2_customers_update, { customer_id: id })
      expect(api[:method]).to eql('PATCH')
      expect(api[:path]).to eql("/v2/customers/#{id}")
    end

    it ':v2_customers_address_create' do
      api = act.generate_path(:v2_customers_address_create, { customer_id: id })
      expect(api[:method]).to eql('POST')
      expect(api[:path]).to eql("/v2/customers/#{id}/address")
    end

    it ':v2_customers_address_delete' do
      api = act.generate_path(:v2_customers_address_delete, { customer_id: id })
      expect(api[:method]).to eql('DELETE')
      expect(api[:path]).to eql("/v2/customers/#{id}/address")
    end

    it ':v2_customers_address' do
      api = act.generate_path(:v2_customers_address, { customer_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/customers/#{id}/address")
    end

    it ':v2_customers_address_update' do
      api = act.generate_path(:v2_customers_address_update, { customer_id: id })
      expect(api[:method]).to eql('PATCH')
      expect(api[:path]).to eql("/v2/customers/#{id}/address")
    end

    it ':v2_customers_chats' do
      api = act.generate_path(:v2_customers_chats, { customer_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/customers/#{id}/chats")
    end

    it ':v2_customers_chats_create' do
      api = act.generate_path(:v2_customers_chats_create, { customer_id: id, chat_id: id })
      expect(api[:method]).to eql('POST')
      expect(api[:path]).to eql("/v2/customers/#{id}/chats/#{id}")
    end

    it ':v2_customers_chats_update' do
      api = act.generate_path(:v2_customers_chats_update, { customer_id: id, chat_id: id })
      expect(api[:method]).to eql('PUT')
      expect(api[:path]).to eql("/v2/customers/#{id}/chats/#{id}")
    end

    it ':v2_customers_emails_create' do
      api = act.generate_path(:v2_customers_emails_create, { customer_id: id })
      expect(api[:method]).to eql('POST')
      expect(api[:path]).to eql("/v2/customers/#{id}/emails")
    end

    it ':v2_customers_emails' do
      api = act.generate_path(:v2_customers_emails, { customer_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/customers/#{id}/emails")
    end

    it ':v2_customers_emails_update' do
      api = act.generate_path(:v2_customers_emails_update, { customer_id: id, email_id: id })
      expect(api[:method]).to eql('PUT')
      expect(api[:path]).to eql("/v2/customers/#{id}/emails/#{id}")
    end

    it ':v2_customers_emails_delete' do
      api = act.generate_path(:v2_customers_emails_delete, { customer_id: id, email_id: id })
      expect(api[:method]).to eql('DELETE')
      expect(api[:path]).to eql("/v2/customers/#{id}/emails/#{id}")
    end

    it ':v2_customers_phones_create' do
      api = act.generate_path(:v2_customers_phones_create, { customer_id: id })
      expect(api[:method]).to eql('POST')
      expect(api[:path]).to eql("/v2/customers/#{id}/phones")
    end

    it ':v2_customers_phones' do
      api = act.generate_path(:v2_customers_phones, { customer_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/customers/#{id}/phones")
    end

    it ':v2_customers_phones_update' do
      api = act.generate_path(:v2_customers_phones_update, { customer_id: id, phone_id: id })
      expect(api[:method]).to eql('PUT')
      expect(api[:path]).to eql("/v2/customers/#{id}/phones/#{id}")
    end

    it ':v2_customers_phones_delete' do
      api = act.generate_path(:v2_customers_phones_delete, { customer_id: id, phone_id: id })
      expect(api[:method]).to eql('DELETE')
      expect(api[:path]).to eql("/v2/customers/#{id}/phones/#{id}")
    end

    it ':v2_customers_social_create' do
      api = act.generate_path(:v2_customers_social_create, { customer_id: id })
      expect(api[:method]).to eql('POST')
      expect(api[:path]).to eql("/v2/customers/#{id}/social-profiles")
    end

    it ':v2_customers_social' do
      api = act.generate_path(:v2_customers_social, { customer_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/customers/#{id}/social-profiles")
    end

    it ':v2_customers_social_update' do
      api = act.generate_path(:v2_customers_social_update, { customer_id: id, profile_id: id })
      expect(api[:method]).to eql('PUT')
      expect(api[:path]).to eql("/v2/customers/#{id}/social-profiles/#{id}")
    end

    it ':v2_customers_social_delete' do
      api = act.generate_path(:v2_customers_social_delete, { customer_id: id, profile_id: id })
      expect(api[:method]).to eql('DELETE')
      expect(api[:path]).to eql("/v2/customers/#{id}/social-profiles/#{id}")
    end

    it ':v2_customers_website_create' do
      api = act.generate_path(:v2_customers_website_create, { customer_id: id })
      expect(api[:method]).to eql('POST')
      expect(api[:path]).to eql("/v2/customers/#{id}/websites")
    end

    it ':v2_customers_website' do
      api = act.generate_path(:v2_customers_website, { customer_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/customers/#{id}/websites")
    end

    it ':v2_customers_website_update' do
      api = act.generate_path(:v2_customers_website_update, { customer_id: id, website_id: id })
      expect(api[:method]).to eql('PUT')
      expect(api[:path]).to eql("/v2/customers/#{id}/websites/#{id}")
    end

    it ':v2_customers_website_delete' do
      api = act.generate_path(:v2_customers_website_delete, { customer_id: id, website_id: id })
      expect(api[:method]).to eql('DELETE')
      expect(api[:path]).to eql("/v2/customers/#{id}/websites/#{id}")
    end

    it ':v2_customers_properties_update' do
      api = act.generate_path(:v2_customers_properties_update, { customer_id: id })
      expect(api[:method]).to eql('PATCH')
      expect(api[:path]).to eql("/v2/customers/#{id}/properties")
    end
  end

  context '/v2/mailboxes' do
    it ':v2_mailboxes' do
      api = act.generate_path(:v2_mailboxes, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/mailboxes')
    end

    it ':v2_mailbox' do
      api = act.generate_path(:v2_mailbox, { mailbox_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/mailboxes/#{id}")
    end

    it ':v2_mailbox_fields' do
      api = act.generate_path(:v2_mailbox_fields, { mailbox_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/mailboxes/#{id}/fields")
    end

    it ':v2_mailbox_folders' do
      api = act.generate_path(:v2_mailbox_folders, { mailbox_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/mailboxes/#{id}/folders")
    end
  end

  context '/v2/ratings' do
    it ':v2_ratings' do
      api = act.generate_path(:v2_ratings, { rating_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/ratings/#{id}")
    end
  end

  context '/v2/reports' do
    it ':v2_reports_company' do
      api = act.generate_path(:v2_reports_company, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/company')
    end

    it ':v2_reports_company_customers_helped' do
      api = act.generate_path(:v2_reports_company_customers_helped, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/company/customers-helped')
    end

    it ':v2_reports_company_drilldown' do
      api = act.generate_path(:v2_reports_company_drilldown, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/company/drilldown')
    end

    it ':v2_reports_conversations' do
      api = act.generate_path(:v2_reports_conversations, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/conversations')
    end

    it ':v2_reports_conversations_new' do
      api = act.generate_path(:v2_reports_conversations_new, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/conversations/new')
    end

    it ':v2_reports_conversations_channel_volume' do
      api = act.generate_path(:v2_reports_conversations_channel_volume, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/conversations/volume-by-channel')
    end

    it ':v2_reports_conversations_busy_times' do
      api = act.generate_path(:v2_reports_conversations_busy_times, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/conversations/busy-times')
    end

    it ':v2_reports_conversations_drilldown' do
      api = act.generate_path(:v2_reports_conversations_drilldown, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/conversations/drilldown')
    end

    it ':v2_reports_conversations_new_drilldown' do
      api = act.generate_path(:v2_reports_conversations_new_drilldown, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/conversations/new-drilldown')
    end

    it ':v2_reports_conversations_fields_drilldown' do
      api = act.generate_path(:v2_reports_conversations_fields_drilldown, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/conversations/fields-drilldown')
    end

    it ':v2_reports_conversations_messages_received' do
      api = act.generate_path(:v2_reports_conversations_messages_received, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/conversations/received-messages')
    end

    it ':v2_reports_docs' do
      api = act.generate_path(:v2_reports_docs, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/docs')
    end

    it ':v2_reports_happiness' do
      api = act.generate_path(:v2_reports_happiness, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/happiness')
    end

    it ':v2_reports_happiness_ratings' do
      api = act.generate_path(:v2_reports_happiness_ratings, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/happiness/ratings')
    end

    it ':v2_reports_productivity' do
      api = act.generate_path(:v2_reports_productivity, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/productivity')
    end

    it ':v2_reports_productivity_first_response_times' do
      api = act.generate_path(:v2_reports_productivity_first_response_times, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/productivity/first-response-time')
    end

    it ':v2_reports_productivity_replies' do
      api = act.generate_path(:v2_reports_productivity_replies, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/productivity/replies-sent')
    end

    it ':v2_reports_productivity_resolutions_times' do
      api = act.generate_path(:v2_reports_productivity_resolutions_times, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/productivity/resolution-time')
    end

    it ':v2_reports_productivity_resolved' do
      api = act.generate_path(:v2_reports_productivity_resolved, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/productivity/resolved')
    end

    it ':v2_reports_productivity_response_times' do
      api = act.generate_path(:v2_reports_productivity_response_times, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/productivity/response-time')
    end

    it ':v2_reports_user' do
      api = act.generate_path(:v2_reports_user, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/user')
    end

    it ':v2_reports_user_conversation_history' do
      api = act.generate_path(:v2_reports_user_conversation_history, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/user/conversation-history')
    end

    it ':v2_reports_user_customers_helped' do
      api = act.generate_path(:v2_reports_user_customers_helped, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/user/customers-helped')
    end

    it ':v2_reports_user_happiness' do
      api = act.generate_path(:v2_reports_user_happiness, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/user/happiness')
    end

    it ':v2_reports_user_ratings' do
      api = act.generate_path(:v2_reports_user_ratings, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/user/ratings')
    end

    it ':v2_reports_user_replies' do
      api = act.generate_path(:v2_reports_user_replies, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/user/replies')
    end

    it ':v2_reports_user_resolutions' do
      api = act.generate_path(:v2_reports_user_resolutions, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/user/resolutions')
    end

    it ':v2_reports_user_drilldown' do
      api = act.generate_path(:v2_reports_user_drilldown, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/user/drilldown')
    end

    it ':v2_reports_chat' do
      api = act.generate_path(:v2_reports_chat, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/chat')
    end

    it ':v2_reports_email' do
      api = act.generate_path(:v2_reports_email, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/email')
    end

    it ':v2_reports_phone' do
      api = act.generate_path(:v2_reports_phone, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/reports/phone')
    end
  end

  context '/v2/tags' do
    it ':v2_tags' do
      api = act.generate_path(:v2_tags, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/tags')
    end
  end

  context '/v2/teams' do
    it ':v2_teams' do
      api = act.generate_path(:v2_teams, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/teams')
    end

    it ':v2_teams_members' do
      api = act.generate_path(:v2_teams_members, { team_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/teams/#{id}/members")
    end
  end

  context '/v2/users' do
    it ':v2_users' do
      api = act.generate_path(:v2_users, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/users')
    end

    it ':v2_me' do
      api = act.generate_path(:v2_me, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/users/me')
    end

    it ':v2_user' do
      api = act.generate_path(:v2_user, { user_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/users/#{id}")
    end
  end

  context '/v2/webhooks' do
    it ':v2_webhooks_create' do
      api = act.generate_path(:v2_webhooks_create, nil)
      expect(api[:method]).to eql('POST')
      expect(api[:path]).to eql('/v2/webhooks')
    end

    it ':v2_webhooks' do
      api = act.generate_path(:v2_webhooks, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/webhooks')
    end

    it ':v2_webhook' do
      api = act.generate_path(:v2_webhook, { webhook_id: id })
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql("/v2/webhooks/#{id}")
    end

    it ':v2_webhooks_update' do
      api = act.generate_path(:v2_webhooks_update, { webhook_id: id })
      expect(api[:method]).to eql('PUT')
      expect(api[:path]).to eql("/v2/webhooks/#{id}")
    end

    it ':v2_webhooks_delete' do
      api = act.generate_path(:v2_webhooks_delete, { webhook_id: id })
      expect(api[:method]).to eql('DELETE')
      expect(api[:path]).to eql("/v2/webhooks/#{id}")
    end
  end

  context '/v2/workflows' do
    it ':v2_workflows' do
      api = act.generate_path(:v2_workflows, nil)
      expect(api[:method]).to eql('GET')
      expect(api[:path]).to eql('/v2/workflows')
    end

    it ':v2_workflows_run' do
      api = act.generate_path(:v2_workflows_run, { workflow_id: id })
      expect(api[:method]).to eql('POST')
      expect(api[:path]).to eql("/v2/workflows/#{id}/run")
    end

    it ':v2_workflows_update' do
      api = act.generate_path(:v2_workflows_update, { workflow_id: id })
      expect(api[:method]).to eql('PATCH')
      expect(api[:path]).to eql("/v2/workflows/#{id}")
    end
  end
end
