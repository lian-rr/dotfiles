-- General
vim.keymap.set("n", "<Esc>", "<cmd> noh <CR>", { desc = "Clear highlights" })

-- Insert navigation
vim.keymap.set("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "End of line" })

vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })

-- Navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half-page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half-page up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search term" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search term" })

-- Replace
vim.keymap.set("n", "<leader>rr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace all" })
vim.keymap.set(
    "n",
    "<leader>rc",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]],
    { desc = "Replace with confirmation" }
)

-- Save
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", { desc = "Save file" })
vim.keymap.set("n", "<C-S>", "<cmd> wa <CR>", { desc = "Save all files" })

-- Switching between windows
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })

vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk", silent = true })

vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights", silent = true })

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number", silent = true }) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number", silent = true }) -- vim.decrement

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })                   -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })                 -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })                    -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })               -- close current split window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
