local CollectionService = game:GetService("CollectionService")

local t = require(script.Parent.t)

local typeCheck = t.tuple(t.Instance, t.string)

local TagQuery = {}
TagQuery.__index = TagQuery

function TagQuery.new()
	local self = setmetatable({
		_collectionService = CollectionService;
	}, TagQuery)

	return self
end

function TagQuery:getTaggedUnderInstance(instance, tagName)
	assert(typeCheck(instance, tagName))
	local items = {}
	for _index, object in pairs(self._collectionService:GetTagged(tagName)) do
		if object:IsDescendantOf(instance) then
			table.insert(items, object)
		end
	end
	return items
end

return TagQuery.new()