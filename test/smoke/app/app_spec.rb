#
# (C) Copyright IBM Corporation 2018.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

describe file('/var/liberty/servers/jsp-examples/server.xml') do
  it { should exist }
end

describe service('wlp-jsp-examples') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe http('http://localhost:9080/jsp-examples/jsp2/el/basic-arithmetic.jsp', enable_remote_worker: true) do
  its('status') { should cmp 200 }
  its('body') { should match 'Basic Arithmetic' }
end

describe xml('/var/liberty/servers/jsp-examples/server.xml') do
  its("//keyStore[@id='defaultKeyStore']/attribute::password") { should eq ['{xor}Lz4sLCgwLTs='] }
end
