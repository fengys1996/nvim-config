local m = {}

local function job_send(cmd)
	local job_cmd = string.format(':call jobsend(b:terminal_job_id, "%s\\n")', cmd)
	vim.cmd(job_cmd)
end

local clippy_cmd =
"cargo clippy --workspace --all-targets -- -D warnings -D clippy::print_stdout -D clippy::print_stderr"

local check_cmd = "cargo check"

local test_cmd = "cargo nextest run"

function m.clippy()
	if vim.g.screen_vertical then
		vim.cmd("split | terminal")
	else
		vim.cmd("vsplit | terminal")
	end
	job_send(clippy_cmd)
end

function m.check()
	if vim.g.screen_vertical then
		vim.cmd("split | terminal")
	else
		vim.cmd("vsplit | terminal")
	end
	job_send(check_cmd)
end

function m.test()
	if vim.g.screen_vertical then
		vim.cmd("split | terminal")
	else
		vim.cmd("vsplit | terminal")
	end
	job_send(test_cmd)
end

return m
