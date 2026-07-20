require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- maintain visual mode when indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Alt + j/k to move lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==")
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==")
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv")
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv")

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.del("n", "<leader>b")
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

local function safe_bufdelete(bufnr)
  -- Skip invalid or already unloaded buffers
  if not vim.api.nvim_buf_is_valid(bufnr) then
    return
  end
  -- If the buffer is modified, use Neovim's default confirmation logic
  if vim.bo[bufnr].modified then
    local choice = vim.fn.confirm(string.format("Save changes to %s?", vim.fn.bufname(bufnr)), "&Yes\n&No\n&Cancel")
    if choice == 1 then
      vim.api.nvim_buf_call(bufnr, function()
        vim.cmd "write"
      end)
    elseif choice ~= 2 then
      return -- Cancelled
    end
  end
  -- Force delete (since we handled the modified check manually)
  vim.api.nvim_buf_delete(bufnr, { force = true })
end

map("n", "<leader>bd", function()
  safe_bufdelete(vim.api.nvim_get_current_buf())
end, { desc = "Delete Buffer" })

map("n", "<leader>bo", function()
  local current = vim.api.nvim_get_current_buf()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    -- Check if it's listed and isn't the current buffer
    if vim.bo[bufnr].buflisted and bufnr ~= current then
      safe_bufdelete(bufnr)
    end
  end
end, { desc = "Delete Other Buffers" })
