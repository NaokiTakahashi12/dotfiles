return {
  {
    "stevearc/overseer.nvim",
    opts = {
      strategy = "jobstart",
    },
    keys = {
      {
        "<leader>m",
        function()
          local overseer = require("overseer")
          local STATUS = overseer.STATUS

          local function move_qf_to_last_meaningful_item()
            vim.schedule(function()
              local qfinfo = vim.fn.getqflist({ id = 0, items = 1, winid = 1 })
              local items = qfinfo.items or {}
              local winid = qfinfo.winid or 0

              if winid == 0 or #items == 0 then
                return
              end

              local last_meaningful = nil
              for i = #items, 1, -1 do
                local text = items[i].text or ""
                if text:match("%S") then
                  last_meaningful = i
                  break
                end
              end

              if last_meaningful then
                vim.api.nvim_win_call(winid, function()
                  vim.cmd(("silent %dcfirst"):format(last_meaningful))
                end)
              end
            end)
          end

          local function make_task(name, command)
            return overseer.new_task({
              name = name,
              cmd = "bash",
              args = { "-c", command },
              components = {
                {
                  "on_output_quickfix",
                  open = true,
                  items_only = false,
                  tail = true,
                },
                "default",
              },
            })
          end

          local function start_ctest()
            local test_task = make_task(
              "ctest",
              "ctest --test-dir build --output-on-failure"
            )

            test_task:subscribe("on_complete", function()
              move_qf_to_last_meaningful_item()
            end)

            test_task:start()
          end

          local function start_build()
            local build_task = make_task(
              "cmake build",
              "cmake --build build"
            )

            build_task:subscribe("on_complete", function(_, status)
              move_qf_to_last_meaningful_item()

              if status == STATUS.SUCCESS then
                start_ctest()
              end
            end)

            build_task:start()
          end

          local configure_task = make_task(
            "cmake configure",
            "cmake -S . -B build -D CMAKE_EXPORT_COMPILE_COMMANDS=ON"
          )

          configure_task:subscribe("on_complete", function(_, status)
            move_qf_to_last_meaningful_item()

            if status == STATUS.SUCCESS then
              start_build()
            end
          end)

          configure_task:start()
        end,
        desc = "CMake configure, build, and test",
      },
    },
  }
}
