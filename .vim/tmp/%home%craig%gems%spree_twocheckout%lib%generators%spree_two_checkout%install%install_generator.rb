Vim�UnDo� c�2\�(�P�%�	x�d���#�K]��K~�]      R        run 'bundle exec rake railties:install:migrations FROM=spree_mercado_pago'      Q      !       !   !   !    O @    _�                             ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �                  module SpreeMercadoPago     module Generators   4    class InstallGenerator < Rails::Generators::Base             def add_javascripts   c        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_mercado_pago\n"   c        append_file "app/assets/javascripts/admin/all.js", "//= require admin/spree_mercado_pago\n"   	      end             def add_stylesheets   �        inject_into_file "app/assets/stylesheets/store/all.css", " *= require store/spree_mercado_pago\n", :before => /\*\//, :verbose => true   �        inject_into_file "app/assets/stylesheets/admin/all.css", " *= require admin/spree_mercado_pago\n", :before => /\*\//, :verbose => true   	      end             def add_migrations   R        run 'bundle exec rake railties:install:migrations FROM=spree_mercado_pago'   	      end             def run_migrations   D         res = ask "Would you like to run the migrations now? [Y/n]"   ,         if res == "" || res.downcase == "y"   ,           run 'bundle exec rake db:migrate'            else   B           puts "Skiping rake db:migrate, don't forget to run it!"            end   	      end       end     end   end5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �                module SpreeMercadoPago5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �                module SpreeercadoPago5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �                module SpreercadoPago5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �                module SpreecadoPago5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �                module SpreeadoPago5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �                module SpreedoPago5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �                module SpreeoPago5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �                module SpreePago5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �                module Spreeago5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �                module Spreego5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �                module Spreeo5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �                module Spree5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �                 module Generators5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �                module SpreeTwoChec5�_�                       T    ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �               c        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_mercado_pago\n"5�_�                       T    ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �               b        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_ercado_pago\n"5�_�                       T    ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �               a        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_rcado_pago\n"5�_�                       T    ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �               `        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_cado_pago\n"5�_�                       T    ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �               _        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_ado_pago\n"5�_�                       T    ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �               ^        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_do_pago\n"5�_�                       T    ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �               ]        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_o_pago\n"5�_�                       T    ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �               \        append_file "app/assets/javascripts/store/all.js", "//= require store/spree__pago\n"5�_�                       T    ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �               [        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_pago\n"5�_�                       T    ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �               Z        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_ago\n"5�_�                       T    ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �               Y        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_go\n"5�_�                       T    ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �               X        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_o\n"5�_�                       T    ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �               W        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_\n"5�_�                       `    ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �               c        append_file "app/assets/javascripts/admin/all.js", "//= require admin/spree_mercado_pago\n"5�_�                       f    ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �   
            �        inject_into_file "app/assets/stylesheets/store/all.css", " *= require store/spree_mercado_pago\n", :before => /\*\//, :verbose => true5�_�                        f    ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �               �        inject_into_file "app/assets/stylesheets/admin/all.css", " *= require admin/spree_mercado_pago\n", :before => /\*\//, :verbose => true5�_�      !                  Q    ����                                                                                                                                                                                                                                                                                                                                                             O ?�     �               R        run 'bundle exec rake railties:install:migrations FROM=spree_mercado_pago'5�_�                   !   
       ����                                                                                                                                                                                                                                                                                                                                                             O @    �                end�                  end�                    end�                	      end�                         end�                B           puts "Skiping rake db:migrate, don't forget to run it!"�                         else�                ,           run 'bundle exec rake db:migrate'�                ,         if res == "" || res.downcase == "y"�                D         res = ask "Would you like to run the migrations now? [Y/n]"�                      def run_migrations�                 �                	      end�                R        run 'bundle exec rake railties:install:migrations FROM=spree_two_checkout'�                      def add_migrations�                 �                	      end�                �        inject_into_file "app/assets/stylesheets/admin/all.css", " *= require admin/spree_two_checkout\n", :before => /\*\//, :verbose => true�   
             �        inject_into_file "app/assets/stylesheets/store/all.css", " *= require store/spree_two_checkout\n", :before => /\*\//, :verbose => true�   	                   def add_stylesheets�      
           �      	          	      end�                c        append_file "app/assets/javascripts/admin/all.js", "//= require admin/spree_two_checkout\n"�                c        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_two_checkout\n"�                      def add_javascripts�                 �                4    class InstallGenerator < Rails::Generators::Base�                  module Generators�                 module SpreeTwoCheckout�                end�                  end�                    end�                	      end�                         end�                B           puts "Skiping rake db:migrate, don't forget to run it!"�                         else�                ,           run 'bundle exec rake db:migrate'�                ,         if res == "" || res.downcase == "y"�                D         res = ask "Would you like to run the migrations now? [Y/n]"�                      def run_migrations�                 �                	      end�                R        run 'bundle exec rake railties:install:migrations FROM=spree_two_checkout'�                      def add_migrations�                 �                	      end�                �        inject_into_file "app/assets/stylesheets/admin/all.css", " *= require admin/spree_two_checkout\n", :before => /\*\//, :verbose => true�   
             �        inject_into_file "app/assets/stylesheets/store/all.css", " *= require store/spree_two_checkout\n", :before => /\*\//, :verbose => true�   	                   def add_stylesheets�      
           �      	          	      end�                c        append_file "app/assets/javascripts/admin/all.js", "//= require admin/spree_two_checkout\n"�                c        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_two_checkout\n"�                      def add_javascripts�                 �                4    class InstallGenerator < Rails::Generators::Base�                  module Generators�                 module SpreeTwoCheckout�                end�                  end�                    end�                	      end�                         end�                B           puts "Skiping rake db:migrate, don't forget to run it!"�                         else�                ,           run 'bundle exec rake db:migrate'�                ,         if res == "" || res.downcase == "y"�                D         res = ask "Would you like to run the migrations now? [Y/n]"�                      def run_migrations�                 �                	      end�                R        run 'bundle exec rake railties:install:migrations FROM=spree_two_checkout'�                      def add_migrations�                 �                	      end�                �        inject_into_file "app/assets/stylesheets/admin/all.css", " *= require admin/spree_two_checkout\n", :before => /\*\//, :verbose => true�   
             �        inject_into_file "app/assets/stylesheets/store/all.css", " *= require store/spree_two_checkout\n", :before => /\*\//, :verbose => true�   	                   def add_stylesheets�      
           �      	          	      end�                c        append_file "app/assets/javascripts/admin/all.js", "//= require admin/spree_two_checkout\n"�                c        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_two_checkout\n"�                      def add_javascripts�                 �                4    class InstallGenerator < Rails::Generators::Base�                  module Generators�                 module SpreeTwoCheckout�                end�                  end�                    end�                	      end�                         end�                B           puts "Skiping rake db:migrate, don't forget to run it!"�                         else�                ,           run 'bundle exec rake db:migrate'�                ,         if res == "" || res.downcase == "y"�                D         res = ask "Would you like to run the migrations now? [Y/n]"�                      def run_migrations�                 �                	      end�                R        run 'bundle exec rake railties:install:migrations FROM=spree_two_checkout'�                      def add_migrations�                 �                	      end�                �        inject_into_file "app/assets/stylesheets/admin/all.css", " *= require admin/spree_two_checkout\n", :before => /\*\//, :verbose => true�   
             �        inject_into_file "app/assets/stylesheets/store/all.css", " *= require store/spree_two_checkout\n", :before => /\*\//, :verbose => true�   	                   def add_stylesheets�      
           �      	          	      end�                c        append_file "app/assets/javascripts/admin/all.js", "//= require admin/spree_two_checkout\n"�                c        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_two_checkout\n"�                      def add_javascripts�                 �                4    class InstallGenerator < Rails::Generators::Base�                  module Generators�                 module SpreeTwoCheckout5��