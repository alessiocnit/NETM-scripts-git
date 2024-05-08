map = { "topic1":'namespaces', "topic2":'mininet' }

print("a - This is a dictionary: ", map)

print("--- Which is the second topic?", map["topic2"]);

map['topic1']="linux"
print("--- An element has been replaced: ", map)

map["midterm1"] = '5april'
print("--- An element has been added: ", map)

print("--- Is the key topic1 present, which is the value?", map.get('topic1', "Not present"))
print("--- Is the key midterm2 present, which is the value?", map.get('midterm2', "Not present"))
