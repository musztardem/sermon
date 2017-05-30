FactoryGirl.define do
  factory :config, class: Hash do
    trait :valid do
      ping      "8.8.8.8"
      free_mem  256
      emails    ["sample@email.com", "email@sample.com"]

      initialize_with { attributes.stringify_keys }
    end

    trait :without_checks do
      emails    ["sample@email.com", "email@sample.com"]
      slack     {{
        "webhook_url" => "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX",
        "channel" => "general"
      }}

      initialize_with { attributes.stringify_keys }
    end

    trait :without_notifiers do
      ping        "8.8.8.8"
      free_mem    256
      free_space  {{
        "/tmp" => 64,
        "/var/mysql" => 1024
      }}

      initialize_with { attributes.stringify_keys }
    end

    trait :without_channel_name do
      ping      "8.8.8.8"
      free_mem   256
      emails     ["sample@email.com", "email@sample.com"]
      slack      {{
        "webhook_url" => "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"
      }}

      initialize_with { attributes.stringify_keys }
    end

    trait :without_webhook_url do
      ping      "8.8.8.8"
      free_mem   256
      emails     ["sample@email.com", "email@sample.com"]
      slack      {{
        "channel" => "general"
      }}

      initialize_with { attributes.stringify_keys }
    end

    trait :without_free_space_in_hash do
      ping        "8.8.8.8"
      free_mem    256
      free_space  ["/tmp", 64, "/var/mysql", 1024]
      emails      ["sample@email.com", "email@sample.com"]

      initialize_with { attributes.stringify_keys }
    end

    trait :with_invalid_emails_format do
      ping        "8.8.8.8"
      free_mem    256
      emails      "sample@email.com email@sample.com"

      initialize_with { attributes.stringify_keys }
    end
  end
end