-- add next_belt_check to the save
storage.next_belt_check = nil

-- Iterate over all belts, update their layout and remove invalid ones.
if storage.belts then
    for unit_number, belt in pairs(storage.belts) do
        if belt.entity.valid then
            belt.position = belt.entity.position
            belt.direction = belt.entity.direction
            belt.surface = belt.entity.surface
        else
            -- remove belt
            if belt.type == "splitter" then
                belt_functions.remove_splitter(belt.entity, belt.direction, unit_number, belt.surface, belt.position)
            else
                belt_functions.remove_belt(belt.entity, belt.direction, unit_number, belt.surface, belt.position)
            end
        end
    end
end
