-- Add a thin light rule between body rows of every table (LaTeX output only).
-- Pandoc's own longtable LaTeX is generated, then a \rowsep is inserted after
-- each body row except the last. \rowsep is defined in each document's header.
function Table(tbl)
  if not FORMAT:match('latex') then return nil end
  local latex = pandoc.write(pandoc.Pandoc({tbl}), 'latex')
  local head, body = latex:match('^(.-\\endlastfoot\n)(.*)$')
  if not head then return nil end
  local rows, tail = body:match('^(.-)(\\end{longtable}.*)$')
  if not rows then return nil end
  -- row ends are lines finishing with "\\"
  rows = rows:gsub('\\\\\n', '\\\\\n\\rowsep\n')
  rows = rows:gsub('\\rowsep\n$', '')
  return pandoc.RawBlock('latex', head .. rows .. tail)
end
