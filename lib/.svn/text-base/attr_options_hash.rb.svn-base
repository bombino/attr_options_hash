module AttrOptionsHash
  module ActiveRecordExtension
    def self.included(base) 
      base.extend AddAttrOptionsHashMethod
    end 
    module AddAttrOptionsHashMethod
      def attr_options_hash(*columns)
        columns.each do |column_or_hash|
          if column_or_hash.is_a?(Hash)
            column_or_hash.each do |column,type|
              add_attr_options_hash_column(column, type)
            end
          else
            add_attr_options_hash_column(column_or_hash)
          end
        end
        class_eval <<-END
          serialize :options, Hash
          include AttrOptionsHash::ActiveRecordExtension::InstanceMethods
        END
      end
      def add_attr_options_hash_column(column, type = :string)
        class_eval <<-END
          def #{column}
            opt(:#{column})
          end
          def #{column}=(value)
            opt(:#{column}, value, "#{type}")
          end
        END
      end
    end
    module InstanceMethods  
      def opt(a, b = nil, type = nil)
        self.options = {} if self.options.nil?
        if b
          if type == "boolean"
            b = ((b == "0" or b == 0 or b == false) ? nil : true)
          end
          self.options = self.options.merge({ a => b })
        end
        self.options[a]
      end
    end
  end
end 
