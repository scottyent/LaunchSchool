def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What will this have as a return value?
p bar(foo)


=begin
test
bar will call foo, which has a default parameter of no, but returns yes, so it will pass yes
into bar. So bar will return "no" since the ternary will evaluate to false since the param is not equal to no

Actual result: "no"
=end