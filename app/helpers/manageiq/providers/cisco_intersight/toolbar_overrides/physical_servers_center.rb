module ManageIQ
  module Providers
    module CiscoIntersight
      module ToolbarOverrides
        class PhysicalServersCenter < ::ApplicationHelper::Toolbar::Override
          button_group(
            'physical_server_policy_choice',
            [
              select(
                :physical_server_lifecycle_choice,
                nil,
                t = N_('Cisco Intersight'),
                t,
                :enabled => true,
                :items   => [
                  api_button(
                    :physical_server_decommission,
                    nil,
                    N_('Decommission server'),
                    N_('Decommission'),
                    :icon    => "pficon pficon-off fa-lg",
                    :api     => {
                      :action => 'decommission_server',
                      :entity => 'physical_server'
                    },
                    :confirm => N_("Decommission selected servers?"),
                    :enabled => true,
                    :onwhen  => "1+",
                    :options => {:feature => :decommission}
                  ),
                  api_button(
                    :physical_server_recommission,
                    nil,
                    N_('Recommission server'),
                    N_('Recommission'),
                    :icon    => "pficon pficon-off fa-lg",
                    :api     => {
                      :action => 'recommission_server',
                      :entity => 'physical_server'
                    },
                    :confirm => N_("Recommission selected servers?"),
                    :enabled => true,
                    :onwhen  => "1+",
                    :options => {:feature => :recommission}
                  ),
                ]
              )
            ]
          )
        end
      end
    end
  end
end
