assert('parse object') do
  PJSON::parse('{"foo": "bar"}') == {"foo"=>"bar"}
end
assert('parse null') do
  PJSON::parse('{"foo": null}') == {"foo"=>nil}
end
assert('parse array') do
  PJSON::parse('[true, "foo"]')[1] == "foo"
end
assert('stringify boolean') do
  PJSON::stringify(true) == "true"
end
assert('stringify symbol') do
  PJSON::stringify(:symbol) == "\"symbol\""
end
assert('strnigify object with numeric value') do
  PJSON::stringify({"foo"=>"bar"}) == '{"foo":"bar"}'
end
assert('strnigify object with string value') do
  PJSON::stringify({"foo"=> 1}) == '{"foo":1}'
end
assert('stringify object with float value') do
  PJSON::stringify({"foo"=> 2.3}) == '{"foo":2.3}'
end
assert('stringify object with nil value') do
  PJSON::stringify({"foo"=> nil}) == '{"foo":null}'
end
assert('stringify object with boolean key and float value') do
  PJSON::stringify({true=> 3.4}) == '{"true":3.4}'
end
assert('stringify object with object key and float value') do
  PJSON::stringify({{"foo"=> "bar"}=> 1.2}) == '{"{\"foo\"=>\"bar\"}":1.2}'
end
assert('stringify empty array') do
  PJSON::stringify([]) == "[]"
end
assert('strnigify array with few elements') do
  PJSON::stringify([1,true,"foo"]) == "[1,true,\"foo\"]"
end
assert('stringify object with several keys') do
  PJSON::stringify({"foo"=>1, "bar"=> 2}) == '{"bar":2,"foo":1}'
end
assert('stringify multi-byte') do
  PJSON::stringify({"foo"=>"ふー", "bar"=> "ばー"}) == '{"bar":"ばー","foo":"ふー"}'
end
