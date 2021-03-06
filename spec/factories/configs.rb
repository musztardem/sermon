FactoryGirl.define do
  factory :config, class: Hash do
    trait :valid do
      ping      ['8.8.8.8', '8.8.8.1']
      free_mem  256
      emails    ['sample@email.com', 'email@sample.com']

      initialize_with { attributes.stringify_keys }
    end

    trait :without_checks do
      emails    ['sample@email.com', 'email@sample.com']
      slack     do
        {
          'webhook_url' => 'https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX',
          'channel' => 'general'
        }
      end

      initialize_with { attributes.stringify_keys }
    end

    trait :without_notifiers do
      ping        ['8.8.8.8', '8.8.8.1']
      free_mem    256
      free_space  do
        {
          '/tmp' => 64,
          '/var/mysql' => 1024
        }
      end

      initialize_with { attributes.stringify_keys }
    end

    trait :without_channel_name do
      ping ['8.8.8.8', '8.8.8.1']
      free_mem   256
      emails     ['sample@email.com', 'email@sample.com']
      slack      do
        {
          'webhook_url' => 'https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX'
        }
      end

      initialize_with { attributes.stringify_keys }
    end

    trait :without_webhook_url do
      ping ['8.8.8.8', '8.8.8.1']
      free_mem   256
      emails     ['sample@email.com', 'email@sample.com']
      slack      do
        {
          'channel' => 'general'
        }
      end

      initialize_with { attributes.stringify_keys }
    end

    trait :without_free_space_in_hash do
      ping        ['8.8.8.8', '8.8.8.1']
      free_mem    256
      free_space  ['/tmp', 64, '/var/mysql', 1024]
      emails      ['sample@email.com', 'email@sample.com']

      initialize_with { attributes.stringify_keys }
    end

    trait :with_invalid_emails_format do
      ping        ['8.8.8.8', '8.8.8.1']
      free_mem    256
      emails      'sample@email.com email@sample.com'

      initialize_with { attributes.stringify_keys }
    end

    trait :valid_mail_and_free_space do
      emails      ['sample@email.com', 'email@sample.com']
      free_space  do
        {
          '/tmp' => 64,
          '/var/mysql' => 1024
        }
      end

      initialize_with { attributes.stringify_keys }
    end

    trait :with_invalid_ping_format do
      ping      '8.8.8.8'
      emails    ['sample@email.com', 'email@sample.com']

      initialize_with { attributes.stringify_keys }
    end
  end
end
