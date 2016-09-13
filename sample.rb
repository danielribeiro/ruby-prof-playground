require 'ruby-prof'

def fib1(n)
    return 1 if n <=1
    fib1(n - 1) + fib2(n - 2)
end

def fib2(n)
    return 1 if n <=1
    fib2(n - 1) + fib1(n - 2)
end


def main
    r = fib1(25)
    puts "result = #{r}"
end

prof = RubyProf.profile do
    main
end
profile_filename = "./profile.callgrind"
reporter = RubyProf::CallTreePrinter
File.open(profile_filename, 'w') do |io|
    reporter.new(prof).print(io)
end


