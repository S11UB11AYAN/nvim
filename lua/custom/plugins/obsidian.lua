return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
	--   "BufReadPre path/to/my-vault/**.md",
	--   "BufNewFile path/to/my-vault/**.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "Life",
				path = "~/Life",
			},
		},
		notes_subdir = "inbox",
		new_notes_location = "notes_subdir",

		note_id_func = function(title)
			-- Get the current date in the format YYYY-MM-DD.
			local date = os.date("%Y-%m-%d")

			-- Create note IDs in the specified format.
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into a valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end

			-- Generate the timestamp.
			local timestamp = tostring(os.time())

			-- Construct the file name.
			local file_name = date .. "-" .. timestamp .. "-" .. suffix .. ".md"

			return file_name
		end,
		-- see below for full list of options 👇
	},
}
