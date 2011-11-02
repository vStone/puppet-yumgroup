module Puppet::Parser::Functions
  newfunction(:hash_keys, :type => :rvalue, :doc => <<-EODOC
Returns the hash keys as an array.

Prototype:

  hash_keys(x)

If the argument is either an array or a string, we will not attempt to get any
keys but just return the value (as an array) as it is.

  EODOC
  ) do |args|

    Puppet::Parser::Functions.autoloader.loadall
    args = [args] unless args.is_a?(Array)
    arguments = args.shift

    if arguments.is_a?(Array)
      arguments
    elsif arguments.is_a?(String)
      [arguments]
    elsif arguments.is_a?(Hash)
      arguments.keys
    else
      raise puppet::ParseError, "hash_keys(): Unexpected argument type."
    end

  end
end
