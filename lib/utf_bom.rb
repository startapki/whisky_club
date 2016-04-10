module UtfBom
  refine String do
    # Clears Byte-Order Mark (BOM) for UTF-8
    def clear_bom!
      self[0] = ''
      self
    end
  end
end
