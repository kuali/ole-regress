#  Copyright 2005-2013 The Kuali Foundation
#
#  Licensed under the Educational Community License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at:
#
#    http://www.opensource.org/licenses/ecl2.php
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

module OLE_QA::RegressionTest
  # Select an EOCR record from the data/eocr directory.
  class EOCR
    # File and path information.
    attr_reader   :marc_file, :edi_file, :filename
    alias         :mrc_file :marc_file

    def initialize
      full_mrc_paths  = Dir[File.expand_path('data/eocr/mrc/*.mrc')].sort
      @marc_file      = full_mrc_paths.sample
      @edi_file       = @marc_file.gsub('mrc','edi')
      @filename       = @marc_file.split('mrc')[1].delete('/').delete('.')
    end
  end
end