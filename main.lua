-- We saved out company as a lua file, so we can just call "dofile", which parses our company in a right table. 
-- For simplicity reasons we just return the data inside the data file and don't perform any kind of validation.
-- But there is nothing to stop us from calling a "parseCompany { ... }" function, which does all kind of fancy stuff.
-- Ofcause the function must be in the global scope, or lua won't find it, since it is in another code chunk.
company = dofile("data.lua")

-- calculates the total salary of the object we give it
function total( o )
    -- We initialize our total with 0, so we can safely assume that we always return a number.
    local t = 0
    -- Here we do a type check of the current object. If it's a table, we need to go deeper.
    if type(o) == "table" then
        -- We iterate through the whole table and call total on every element.
        for k,v in pairs(o) do
            -- recursion yay!
            t = t + total(v)
        end
    elseif type(o) == "number" then
        -- Look! We found a number. Because we only sace the salary as a number, we don't have to check any further, because we can assume it is a salary.
        -- We just add it to the total
        t = t + o
    end
    -- Here we return our total amount, but only of this sub table or field. If we pass the whole company, we get the total amount.
    return t
end

-- Looks like we need to cut some salarys!
function cut( o )
    -- We do the same kind of recursion in here, but instead of just getting the values we change them.
    if type(o) == "table" then
        for k,v in pairs(o) do
            -- Because Lua does not copy tables we can just write inside the table and we change the table inside the outer scope.
            o[k] = cut(v)
        end
    elseif type(o) == "number" then
        -- We do the same assumption as above: Everything, that's a number is a salary so just cut it in half.
        o = o / 2
    end
    -- We return the original object, if we did not change it. This is for easier recursion, becaus we can just asume step returns the right object.
    return o
end

-- Here we just print the result of our functions so we can see what happened.
print("Total: " .. total(company))
print("Cut: " .. total(cut(company)))