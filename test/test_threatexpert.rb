unless Kernel.respond_to?(:require_relative)
	module Kernel
		def require_relative(path)
			require File.join(File.dirname(caller[0]), path.to_str)
		end
	end
end

require_relative 'helper'

class TestThreatexpert < Minitest::Test
  def test_parse
		t = ThreatExpert::Search.new
		data = t.md5("70cf23409191820593022ca797fbcbd0")
		refute_nil(data)
		assert_equal("ThreatExpert Report", data['report']['title'])
		refute_nil(data['report']['subreports'])
		refute_nil(data['report']['subreports']['subreport'])
		refute_nil(data['report']['subreports']['subreport']['technical_details'])
		refute_nil(data['report']['subreports']['subreport']['technical_details']['known_threat_category_collection'])
		refute_nil(data['report']['subreports']['subreport']['technical_details']['known_threat_category_collection']['known_threat_category'])
		refute_nil(data['report']['subreports']['subreport']['technical_details']['known_threat_category_collection']['known_threat_category'][0])
		assert_equal("Backdoor", data['report']['subreports']['subreport']['technical_details']['known_threat_category_collection']['known_threat_category'][0]['name'])
	end
	
	def test_nil
		t = ThreatExpert::Search.new
		html = t.md5("70cf23409191820593022ca797fbcbd1")
		assert_nil(html)
	end
	
	def test_list
		t = ThreatExpert::Search.new
		hashes = t.name("Worm.Hamweg.Gen")
		assert_equal(159, hashes.length)
	end

	def test_empty_list
		t = ThreatExpert::Search.new
		hashes = t.name("Worm.Hamwex.Gen")
		assert_equal(0, hashes.length)
	end
end
