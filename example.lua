local a = loadstring(game:HttpGet('https://raw.githubusercontent.com/nullcares/jjj/main/main.lua'))()
local win = a:CreateWindow({
	['Title'] = 'my gui';
})
local a = win:NewTab('Tab A')
win:NewTab('Dummy Tab #1')
win:NewTab('Dummy Tab #2')
win:NewTab('Dummy Tab #3')
a:Toggle('Toggle', true, function(bool)
	print(bool and 'Checked' or 'Unchecked')
end)
a:Button('Button', function()
	print('Button was pressed')
end)
--[[
local label = a:Label('Separator (default size)')
a:Separator()
]]
local label = a:Label('If you see this, something broke')
label:Update({
	['Size'] = 50;
	['Font'] = Enum.Font.Cartoon;
	['Text'] = '[TEXT PROPERTIES] It works!';
})
a:Input('Input numbers:', 'Placeholder', 123, 'number', function(input)
	print('Text: '..input..'\nType: '..type(input))
end)
a:Bind('Bind me', Enum.KeyCode.E, function(key)
	print('Pressed: '..key.Name)
end)
a:Dropdown('Dropdown', {'A', 'B', 'C'}, 'Choose', function(choice)
	print('You chose: '..choice)
end)
