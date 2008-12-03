module Nokogiri
  module XML
    class XPathContext
      
      attr_accessor :cstruct

      def self.new(node)
        LibXML.xmlXPathInit()

        ptr = LibXML.xmlXPathNewContext(node.cstruct[:doc])

        ctx = allocate
        ctx.cstruct = LibXML::XmlXpathContext.new(ptr)
        ctx.cstruct[:node] = node.cstruct
        ctx
      end

      def evaluate(search_path)
        ptr = LibXML::xmlXPathEvalExpression(search_path, cstruct)
        raise(XPath::SyntaxError, "Couldn't evaluate expression '#{search_path}'") if ptr.null?

        xpath = XML::XPath.new
        xpath.cstruct = LibXML::XmlXpath.new(ptr)
        xpath.document = LibXML::XmlNode.new(cstruct[:node])[:doc] # TODO doc->private
        xpath
      end

    end
  end
end