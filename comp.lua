local function createComp(data)
  assert(data._name)
  assert(type(data._name) == "string")
  return data
end
return createComp