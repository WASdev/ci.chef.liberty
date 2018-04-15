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

describe directory('/opt/was/liberty/wlp') do
  it { should exist }
end

describe directory('/opt/was/liberty/wlp/bin/jaxws') do
  it { should exist }
end

describe directory('/opt/was/liberty/extras/wlp') do
  it { should_not exist }
end

describe file('/opt/was/liberty/wlp/usr/servers/testServer/server.xml') do
  it { should exist }
end

describe service('wlp-testServer') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
