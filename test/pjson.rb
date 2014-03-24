assert('parse object') do
  PJSON::parse('{"foo": "bar"}') == {"foo"=>"bar"}
end
assert('parse null') do
  PJSON::parse('{"foo": null}') == {"foo"=>nil}
end
assert('parse array') do
  PJSON::parse('[true, "foo"]')[1] == "foo"
end
assert('complex test obj-ary') do
  PJSON::parse('{"label":[true, "foo"]}') == {"label"=>[true, "foo"]}
end
assert('complex test ary-obj') do
  PJSON::parse('[true, {"foo" : "bar"}]') == [true, {"foo" => "bar"}]
end
