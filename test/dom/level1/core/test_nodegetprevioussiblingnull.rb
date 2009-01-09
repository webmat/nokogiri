
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001 World Wide Web Consortium,
(Massachusetts Institute of Technology, Institut National de
Recherche en Informatique et en Automatique, Keio University). All
Rights Reserved. This program is distributed under the W3C's Software
Intellectual Property License. This program is distributed in the
hope that it will be useful, but WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.
See W3C License http://www.w3.org/Consortium/Legal/ for more details.

=end
#

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'helper'))

###
#     If there is not a node immediately preceding this node the
#     "getPreviousSibling()" method returns null.
#     
#     Retrieve the first child of the second employee and
#     invoke the "getPreviousSibling()" method.   It should
#     be set to null. 
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-640FB3C8]
##
DOMTestCase('nodegetprevioussiblingnull') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
    ##
    ##   check if loaded documents are supported for content type
    ##
    contentType = getContentType()
    preload(contentType, "staff", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_nodegetprevioussiblingnull
    doc = nil
    elementList = nil
    employeeNode = nil
    fcNode = nil
    psNode = nil
    doc = load_document("staff", false)
      elementList = doc.getElementsByTagName("employee")
      employeeNode = elementList.item(2)
      fcNode = employeeNode.firstChild()
      psNode = fcNode.previousSibling()
      assert_nil(psNode, "nodeGetPreviousSiblingNullAssert1")
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/nodegetprevioussiblingnull"
  end
end
