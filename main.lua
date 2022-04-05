
-- fuck

local uis = game:GetService('UserInputService')

local function switch_tabs(sel, children, tabs, page)
	local status = {
		[true] = Color3.fromRGB(88, 53, 223);
		[false] = Color3.fromRGB(36, 43, 68);
	}

	for _, v in pairs(tabs:GetChildren()) do
		if v:IsA('TextButton') then
			v.BackgroundColor3 = status[v == sel]
		end
	end

	for _, v in pairs(page:GetChildren()) do
		if v:IsA('Frame') then
			v.Parent = nil
		end
	end

	for _, v in pairs(children) do
		v.Parent = page
	end
end

local function count_tabs(tabs)
	local a = 0
	for _, v in pairs(tabs:GetChildren()) do
		if v:IsA('TextButton') then
			a += 1
		end
	end
	if a == 0 then -- dividing by 0 would error
		return 1
	end
	return a
end

local function create_choice(dd, tab, callback)
	local mouse = game:GetService('Players').LocalPlayer:GetMouse()
	for _, v in pairs(dd:GetChildren()) do
		if v:IsA('TextButton') then
			v:Destroy()
		end
	end
	
	local Option = Instance.new('TextButton')
	
	Option.Name = "Option"
	Option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Option.BackgroundTransparency = 1.000
	Option.Size = UDim2.new(1, 0, 0, 20)
	Option.Font = Enum.Font.Code
	Option.TextColor3 = Color3.fromRGB(255, 255, 255)
	Option.TextScaled = true
	Option.TextSize = 14.000
	Option.TextWrapped = true
	Option.TextXAlignment = Enum.TextXAlignment.Left
	
	for _, v in pairs(tab) do
		local n = Option:Clone()
		n.Text = v
		n.Parent = dd
		n.MouseButton1Click:Connect(function()
			callback(v)
			dd.Visible = false
		end)
	end
	local mp = uis:GetMouseLocation()
	dd.Position = UDim2.new(0, mp.X, 0, mp.Y - dd.AbsoluteSize.Y/2)
	dd.Visible = true
end

local Factory = {}

function Factory:CreateWindow(WINDOW_PROPS)
	local ScreenGui = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local Navigation = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local Toggle = Instance.new("ImageButton")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local Tabs = Instance.new("Frame")
	local Content = Instance.new("Frame")
	local UIGridLayout = Instance.new("UIGridLayout")
	local Page = Instance.new("ScrollingFrame")
	local Holder = Instance.new("Frame")
	local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
	local UIListLayout = Instance.new("UIListLayout")
	local ACTIVE_DD = Instance.new("Frame")
	local Option = Instance.new("TextButton")
	local UIListLayout_2 = Instance.new("UIListLayout")

	--Properties:

	pcall(function()
		syn.protect_gui()
	end)
	local bound = WINDOW_PROPS['Toggle'] or Enum.KeyCode.LeftAlt
	uis.InputBegan:Connect(function(input, gpe)
		if not gpe and input.KeyCode == bound then
			ScreenGui.Enabled = not ScreenGui.Enabled
		end
	end)
	ScreenGui.Parent = game:GetService('CoreGui')
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.name = 'chaching'
	ScreenGui.ResetOnSpawn = false

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = ScreenGui
	MainFrame.BackgroundColor3 = Color3.fromRGB(31, 37, 58)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.314948022, 0, 0.288288295, 0)
	MainFrame.Size = UDim2.new(0.369304568, 0, 0.423423409, 0)

	Navigation.Name = "Navigation"
	Navigation.Parent = MainFrame
	Navigation.BackgroundColor3 = Color3.fromRGB(34, 39, 61)
	Navigation.BorderSizePixel = 0
	Navigation.Size = UDim2.new(1, 0, 0.0638297871, 0)

	Title.Name = "Title"
	Title.Parent = Navigation
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0735930726, 0, 0.0476190485, 0)
	Title.Size = UDim2.new(0.85281384, 0, 0.857142866, 0)
	Title.Font = Enum.Font.Code
	Title.Text = WINDOW_PROPS['Title']
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextScaled = true
	Title.TextSize = 14.000
	Title.TextWrapped = true

	Toggle.Name = "Toggle"
	Toggle.Parent = Navigation
	Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Toggle.BackgroundTransparency = 1.000
	Toggle.Position = UDim2.new(0.954545438, 0, 0, 0)
	Toggle.Size = UDim2.new(0.0454545468, 0, 1, 0)
	Toggle.Image = "http://www.roblox.com/asset/?id=4988112250"
	
	Toggle.MouseButton1Click:Connect(function()
		ScreenGui.Enabled = not ScreenGui.Enabled
	end)

	UIAspectRatioConstraint.Parent = Toggle

	Tabs.Name = "Tabs"
	Tabs.Parent = MainFrame
	Tabs.BackgroundColor3 = Color3.fromRGB(42, 50, 79)
	Tabs.BorderSizePixel = 0
	Tabs.Position = UDim2.new(0, 0, 0.0638297871, 0)
	Tabs.Size = UDim2.new(0.227272734, 0, 0.93617022, 0)

	Content.Name = "Content"
	Content.Parent = Tabs
	Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Content.BackgroundTransparency = 1.000
	Content.Position = UDim2.new(0.0476190485, 0, 0.0128570655, 0)
	Content.Size = UDim2.new(0.895238101, 0, 0.968953609, 0)

	UIGridLayout.Parent = Content
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
	UIGridLayout.CellSize = UDim2.new(1, 0, 0.5, 0)

	--[[
		local Tab = Instance.new("TextButton")
	local Tab_2 = Instance.new("TextButton")
	
		Tab.Name = "Tab"
	Tab.Parent = Content
	Tab.BackgroundColor3 = Color3.fromRGB(36, 43, 68)
	Tab.BorderColor3 = Color3.fromRGB(34, 39, 61)
	Tab.BorderSizePixel = 2
	Tab.Size = UDim2.new(0, 200, 0, 50)
	Tab.Font = Enum.Font.Code
	Tab.Text = "TAB"
	Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
	Tab.TextSize = 32.000
	Tab.TextWrapped = true

	Tab_2.Name = "Tab"
	Tab_2.Parent = Content
	Tab_2.BackgroundColor3 = Color3.fromRGB(88, 53, 223)
	Tab_2.BorderColor3 = Color3.fromRGB(34, 39, 61)
	Tab_2.BorderSizePixel = 2
	Tab_2.Size = UDim2.new(0, 200, 0, 50)
	Tab_2.Font = Enum.Font.Code
	Tab_2.Text = "TAB SELECTED"
	Tab_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Tab_2.TextSize = 32.000
	Tab_2.TextWrapped = true
	]]

	Page.Name = "Page"
	Page.Parent = MainFrame
	Page.Active = true
	Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Page.BackgroundTransparency = 1.000
	Page.BorderSizePixel = 0
	Page.Position = UDim2.new(0.227272734, 0, 0.0729483292, 0)
	Page.Size = UDim2.new(0.772727251, 0, 0.927051663, 0)
	Page.BottomImage = ""
	Page.CanvasSize = UDim2.new(0, 0, 0, 0)
	Page.TopImage = ""

	Holder.Name = "Holder"
	Holder.Parent = Page
	Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Holder.BackgroundTransparency = 1.000
	Holder.Size = UDim2.new(0.967999995, 0, 0, 0)
	Holder.AutomaticSize = Enum.AutomaticSize.Y

	UIListLayout.Parent = Holder
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	ACTIVE_DD.Name = "ACTIVE_DD"
	ACTIVE_DD.Parent = ScreenGui
	ACTIVE_DD.BackgroundColor3 = Color3.fromRGB(88, 53, 223)
	ACTIVE_DD.Size = UDim2.new(0, 93,0, 8)
	ACTIVE_DD.Visible = false
	ACTIVE_DD.AutomaticSize = Enum.AutomaticSize.Y

	UIListLayout_2.Parent = ACTIVE_DD
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

	local Tabs = {}

	function Tabs:NewTab(title, tsize)
		local default_y = WINDOW_PROPS['Default_Y'] or 30
		
		local Tab = Instance.new("TextButton")

		Tab.Name = "Tab"
		Tab.Parent = Content
		Tab.BackgroundColor3 = Color3.fromRGB(36, 43, 68)
		Tab.BorderColor3 = Color3.fromRGB(34, 39, 61)
		Tab.BorderSizePixel = 2
		Tab.Size = UDim2.new(0, 200, 0, 50)
		Tab.Font = Enum.Font.Code
		Tab.Text = title
		Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
		Tab.TextSize = tsize or 32.000
		Tab.TextWrapped = true
		Tab.TextScaled = (tsize == 0 and true or false)

		UIGridLayout.CellSize = UDim2.new(1, 0, 1/count_tabs(Content), 0)

		local Children = {}

		Tab.MouseButton1Click:Connect(function()
			switch_tabs(Tab, Children, Content, Holder)
		end)

		local Utils = {}

		function Utils:Toggle(title, status, callback)
			local Toggle_2 = Instance.new('Frame')
			local Title_2 = Instance.new('TextLabel')
			local Toggle_3 = Instance.new('ImageButton')
			local UIAspectRatioConstraint_2 = Instance.new('UIAspectRatioConstraint')

			Toggle_2.Name = "Toggle"
			Toggle_2.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
			Toggle_2.BackgroundTransparency = 1.000
			Toggle_2.Size = UDim2.new(1, 0, 0, default_y)

			Title_2.Name = "Title"
			Title_2.Parent = Toggle_2
			Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_2.BackgroundTransparency = 1.000
			Title_2.Position = UDim2.new(0.102530383, 0, 0.166666672, 0)
			Title_2.Size = UDim2.new(0.866865754, 0, 0.658095121, 0)
			Title_2.Font = Enum.Font.Code
			Title_2.Text = title
			Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title_2.TextScaled = true
			Title_2.TextSize = 14.000
			Title_2.TextWrapped = true
			Title_2.TextXAlignment = Enum.TextXAlignment.Left

			Toggle_3.Name = "Toggle"
			Toggle_3.Parent = Toggle_2
			Toggle_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Toggle_3.BorderColor3 = Color3.fromRGB(34, 39, 61)
			Toggle_3.Position = UDim2.new(0.0260435604, 0, 0.166666746, 0)
			Toggle_3.Size = UDim2.new(0.0571302697, 0, 0.658095002, 0)
			Toggle_3.Image = ""
			Toggle_3.ImageColor3 = Color3.fromRGB(88, 53, 223)

			UIAspectRatioConstraint_2.Parent = Toggle_3

			local texture = {
				[true] = 'http://www.roblox.com/asset/?id=1746891745';
				[false] = '';
			}
			local state = status

			Toggle_3.MouseButton1Click:Connect(function()
				state = not state
				Toggle_3.Image = texture[state]
				if type(callback) == 'function' then
					callback(state)
				end
			end)
			Toggle_3.Image = texture[state]

			table.insert(Children, Toggle_2)

			return Toggle_2
		end
		
		function Utils:Button(title, callback)
			local Button = Instance.new('Frame')
			local Button_2 = Instance.new('TextButton')
			
			Button.Name = "Button"
			Button.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
			Button.BackgroundTransparency = 1.000
			Button.Size = UDim2.new(1, 0, 0, default_y)

			Button_2.Name = "Button"
			Button_2.Parent = Button
			Button_2.BackgroundColor3 = Color3.fromRGB(88, 53, 223)
			Button_2.Position = UDim2.new(0.0202561244, 0, 0.166666672, 0)
			Button_2.Size = UDim2.new(0.952033758, 0, 0.666666687, 0)
			Button_2.Font = Enum.Font.Code
			Button_2.Text = title
			Button_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button_2.TextSize = 16.000
			
			Button_2.MouseButton1Click:Connect(function()
				if type(callback) == 'function' then
					callback()
				end
			end)
			
			table.insert(Children, Button)
			
			return Button_2
		end
		
		function Utils:Separator(size)
			local Separator = Instance.new('Frame')
			
			Separator.Name = "Separator"
			Separator.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
			Separator.BackgroundTransparency = 1.000
			Separator.Size = UDim2.new(1, 0, 0, size or 50)
			
			table.insert(Children, Separator)
			
			return Separator
		end
		
		function Utils:Label(text, props)
			local Label = Instance.new('Frame')
			local Title_6 = Instance.new('TextLabel')
			
			Label.Name = "Label"
			Label.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
			Label.BackgroundTransparency = 1.000
			Label.Size = UDim2.new(1, 0, 0, default_y)

			Title_6.Name = "Title"
			Title_6.Parent = Label
			Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_6.BackgroundTransparency = 1.000
			Title_6.Position = UDim2.new(0.0260434765, 0, 0.166666672, 0)
			Title_6.Size = UDim2.new(0.94335264, 0, 0.658095121, 0)
			Title_6.Font = Enum.Font.Code
			Title_6.Text = text
			Title_6.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title_6.TextScaled = true
			Title_6.TextSize = 14.000
			Title_6.TextWrapped = true
			Title_6.TextXAlignment = Enum.TextXAlignment.Left
			
			if props ~= nil then
				for i, v in pairs(props) do
					pcall(function()
						Title_6[i] = v
					end)
					if i == 'Size' then
						Label.Size = UDim2.new(1, 0, 0, v)
					end
				end
			end
			
			local Designer = {}
			
			function Designer:Update(props)
				if props == nil then return end
				for i, v in pairs(props) do
					pcall(function()
						Title_6[i] = v
					end)
					if i == 'Size' then
						Label.Size = UDim2.new(1, 0, 0, v)
					end
				end
			end
			
			table.insert(Children, Label)
			
			return Designer, Label
		end
		
		function Utils:Input(title, placeholder, default, inputtype, callback)
			local Input = Instance.new('Frame')
			local Title_3 = Instance.new('TextLabel')
			local Input_2 = Instance.new("TextBox")

			Input.Name = "Input"
			Input.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
			Input.BackgroundTransparency = 1.000
			Input.Size = UDim2.new(1, 0, 0, default_y)

			Title_3.Name = 'Title'
			Title_3.Parent = Input
			Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_3.BackgroundTransparency = 1.000
			Title_3.Position = UDim2.new(0.0215062313, 0, 0.166666672, 0)
			Title_3.Size = UDim2.new(0.649836779, 0, 0.658095121, 0)
			Title_3.Font = Enum.Font.Code
			Title_3.Text = title
			Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title_3.TextScaled = true
			Title_3.TextSize = 14.000
			Title_3.TextWrapped = true
			Title_3.TextXAlignment = Enum.TextXAlignment.Left

			Input_2.Name = "Input"
			Input_2.Parent = Input
			Input_2.BackgroundColor3 = Color3.fromRGB(42, 50, 79)
			Input_2.Position = UDim2.new(0.688705325, 0, 0.166666672, 0)
			Input_2.Size = UDim2.new(0.283584565, 0, 0.666666687, 0)
			Input_2.Font = Enum.Font.Code
			Input_2.PlaceholderText = placeholder
			Input_2.Text = default or ''
			Input_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			Input_2.TextScaled = true
			Input_2.TextSize = 18.000
			Input_2.TextWrapped = true

			local default_ph = Input_2.PlaceholderText

			Input_2.FocusLost:Connect(function()
				local text = Input_2.Text
				if inputtype == 'text' then
				elseif inputtype == 'number' then
					local a = tonumber(text)
					if a ~= nil then
						text = a
					else
						Input_2.Text = ''
						task.spawn(function()
							Input_2.PlaceholderText = 'Legal input: '..inputtype
							task.wait(3)
							Input_2.PlaceholderText = default_ph
						end)
					end
				else
					error('Invalid input type ("text" or "number" are legal)', 0)
				end
				if type(callback) == 'function' then
					callback(text)
				end
			end)

			table.insert(Children, Input)

			return Input
		end
		
		function Utils:Bind(title, default, callback)
			local bound = default
			
			local Bind = Instance.new('Frame')
			local Title_4 = Instance.new('TextLabel')
			local Bound = Instance.new('TextButton')
			
			Bind.Name = "Bind"
			Bind.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
			Bind.BackgroundTransparency = 1.000
			Bind.Size = UDim2.new(1, 0, 0, default_y)

			Title_4.Name = "Title"
			Title_4.Parent = Bind
			Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_4.BackgroundTransparency = 1.000
			Title_4.Position = UDim2.new(0.0215062313, 0, 0.166666672, 0)
			Title_4.Size = UDim2.new(0.649836779, 0, 0.658095121, 0)
			Title_4.Font = Enum.Font.Code
			Title_4.Text = title
			Title_4.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title_4.TextScaled = true
			Title_4.TextSize = 14.000
			Title_4.TextWrapped = true
			Title_4.TextXAlignment = Enum.TextXAlignment.Left

			Bound.Name = "Bound"
			Bound.Parent = Bind
			Bound.BackgroundColor3 = Color3.fromRGB(88, 53, 223)
			Bound.Position = UDim2.new(0.688705325, 0, 0.164061487, 0)
			Bound.Size = UDim2.new(0.283526063, 0, 0.669271588, 0)
			Bound.Font = Enum.Font.Code
			Bound.Text = bound.Name or '?'
			Bound.TextColor3 = Color3.fromRGB(255, 255, 255)
			Bound.TextScaled = true
			Bound.TextSize = 16.000
			Bound.TextWrapped = true
			
			local uis = uis
			local binding = false
			
			Bound.MouseButton1Click:Connect(function()
				binding = not binding
				if binding then
					Bound.Text = '...'
				end
			end)
			
			uis.InputBegan:Connect(function(input, gpe)
				if not gpe and input.KeyCode then
					if binding then
						binding = false
						bound = input.KeyCode
						Bound.Text = bound.Name
					elseif binding == false and type(callback) == 'function' and input.KeyCode == bound then
						callback(bound, 'pressed')
					end
				end
			end)
			
			uis.InputEnded:Connect(function(input, gpe)
				if not gpe then
					if input.KeyCode == bound then
						callback(bound, 'released')
					end
				end
			end)
			
			table.insert(Children, Bind)
			
			return Bind
		end
		
		function Utils:Dropdown(title, options, default, callback)
			local Dropdown = Instance.new('Frame')
			local Title_7 = Instance.new('TextLabel')
			local Bound_2 = Instance.new('TextButton')
			
			local above = #options > 1
			
			Dropdown.Name = "Dropdown"
			Dropdown.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
			Dropdown.BackgroundTransparency = 1.000
			Dropdown.Size = UDim2.new(1, 0, 0, 30)

			Title_7.Name = "Title"
			Title_7.Parent = Dropdown
			Title_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_7.BackgroundTransparency = 1.000
			Title_7.Position = UDim2.new(0.0215062313, 0, 0.166666672, 0)
			Title_7.Size = UDim2.new(0.649836779, 0, 0.658095121, 0)
			Title_7.Font = Enum.Font.Code
			Title_7.Text = title
			Title_7.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title_7.TextScaled = true
			Title_7.TextSize = 14.000
			Title_7.TextWrapped = true
			Title_7.TextXAlignment = Enum.TextXAlignment.Left
			
			Bound_2.Name = "Bound"
			Bound_2.Parent = Dropdown
			Bound_2.BackgroundColor3 = Color3.fromRGB(88, 53, 223)
			Bound_2.Position = UDim2.new(0.688705325, 0, 0.164061487, 0)
			Bound_2.Size = UDim2.new(0.283526063, 0, 0.669271588, 0)
			Bound_2.Font = Enum.Font.Code
			if above then
				default = default..' (...)'
			end
			Bound_2.Text = default
			Bound_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			Bound_2.TextScaled = true
			Bound_2.TextSize = 16.000
			Bound_2.TextWrapped = true
			
			Bound_2.MouseButton1Click:Connect(function()
				if above == false then return end
				create_choice(ACTIVE_DD, options, function(choice)
					Bound_2.Text = choice..' (...)'
					if type(callback) == 'function' then
						callback(choice)
					end
				end)
			end)
			
			table.insert(Children, Dropdown)
			
			return Dropdown
		end
		
		return Utils, Tab
	end

	return Tabs, ScreenGui
end

return Factory
