function Inline (el)
  if el.t == "Cite" then
    for k,_ in ipairs(el.content) do

      if el.content[k].t == "Str" and el.content[k].text == "Ayhan,"
      and el.content[k+1].t == "Space"
      and el.content[k+2].t == "Str" and el.content[k+2].text:find("^K. J.") then

          local _,e = el.content[k+2].text:find("^K. J.")
          local rest = el.content[k+2].text:sub(e+1) 
          el.content[k] = pandoc.Underline { pandoc.Str("Ayhan, K. J.") }
          el.content[k+1] = pandoc.Str(rest)
          table.remove(el.content, k+2) 
      end
    end
  end
  return el
end