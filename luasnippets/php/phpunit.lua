local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require "luasnip.util.events"
local ai = require "luasnip.nodes.absolute_indexer"
local fmt = require("luasnip.extras.fmt").fmt
local postfix = require("luasnip.extras.postfix").postfix

local function snakeize(args) return string.lower(string.gsub(args[1][1], "%u", "_%1")) end
local namefile = function()
  return f(function(_args, snip)
    local name = vim.split(snip.snippet.env.TM_FILENAME, ".", true)
    return name[1] or ""
  end)
end

return {
  s(
    { trig = "__te", dscr = "Generic boilerplate for simple Php Unit Test" },
    fmt(
      [[
        /**
         * @test
         * {}
         * @group {}
         */
        public function {}(): void
        {{
            {}
        }}
      ]],
      {
        f(snakeize, { 1 }),
        namefile(),
        i(1, "testName"),
        i(0),
      }
    )
  ),
  -- s({ trig = "asco"}, fmt("$this->assertCount({}, {})", { i(1, "expected"), i(2, "actual") })),
  -- s({ trig = "asi"}, fmt("$this->assertInstanceOf({}, {})", { i(1, "expected"), i(2, "actual") })),
  -- s({ trig = "ashk"}, fmt("$this->assertArrayHasKey({}, {})", { i(1, "expected"), i(2, "actual") })),
  -- s({ trig = "ase"}, fmt("$this->assertEquals({}, {})", { i(1, "expected"), i(2, "actual") })),
  -- s({ trig = "asne"}, fmt("$this->assertNotEquals({}, {})", { i(1, "expected"), i(2, "actual") })),
  -- s({ trig = "ass"}, fmt("$this->assertSame({}, {})", { i(1, "expected"), i(2, "actual") })),
  -- s({ trig = "asns"}, fmt("$this->assertNotSame({}, {})", { i(1, "expected"), i(2, "actual") })),
  -- s({ trig = "asf"}, fmt("$this->assertFalse({})", { i(1, "actual")})),
  -- s({ trig = "ast"}, fmt("$this->assertTrue({})", { i(1, "actual") })),

  -- s({ trig = "ase"}, fmt("$this->assertEquals({}, {})", placeholderMap)),
  -- s({ trig = "asne"}, fmt("$this->assertNotEquals({}, {})", placeholderMap)),
  -- s({ trig = "ass"}, fmt("$this->assertSame({}, {})", placeholderMap)),
  -- s({ trig = "asns"}, fmt("$this->assertNotSame({}, {})", placeholderMap)),
  -- s({ trig = "asf"}, fmt("$this->assertFalse({})", singlePlaceholderMap)),
  -- s({ trig = "ast"}, fmt("$this->assertTrue({})", singlePlaceholderMap)),
  -- s({ trig = "asco"}, fmt("$this->assertCount({})", singlePlaceholderMap)),
  -- s({ trig = "asi"}, fmt("$this->assertInstanceOf({}, {})", placeholderMap)),
  -- s({ trig = "ashk"}, fmt("$this->assertArrayHasKey({}, {})", placeholderMap)),
}
-- snippet asfex "$this->assertFileExists('path/to/file')"
--   $this->assertFileExists(${1:'path/to/file'});
--   snippet asfnex "$this->assertFileNotExists('path/to/file')"
--     $this->assertFileNotExists(${1:'path/to/file'});
--   snippet ascon "$this->assertContains($needle, $haystack)"
--     $this->assertContains(${1:$needle}, ${2:$haystack});
--   snippet asncon "$this->assertNotContains($needle, $haystack)"
--     $this->assertNotContains(${1:$needle}, ${2:$haystack});
--   snippet ascono "$this->assertContainsOnly($needle, $haystack)"
--     $this->assertContainsOnly(${1:$needle}, ${2:$haystack});
--   snippet asconoi "$this->assertContainsOnlyInstancesOf(Example::class, $haystack)"
--     $this->assertContainsOnlyInstancesOf(${1:Example}::class, ${2:$haystack});
--   snippet asnhk "$this->assertArrayNotHasKey($key, $array)"
--     this->assertArrayNotHasKey(${1:$key}, ${2:$array});
--   snippet ascha "$this->assertClassHasAttribute($name, Example::class)"
--     $this->assertClassHasAttribute(${1:$attributeName}, ${2:Example}::class);
--   snippet asit "$this->assertInternalType('string', $actual)"
--     $this->assertInternalType(${1:'string'}, ${2:actual});
--   snippet asnco "$this->assertNotCount($count, $haystack)"
--     $this->assertNotCount(${1:$count}, ${2:$haystack});
--   snippet assub "$this->assertArraySubset($subset, $array)"
--     $this->assertArraySubset(${1:$subset}, ${2:$array});
--   snippet asnu "$this->assertNull($a)"
--
