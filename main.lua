local module = {};

module.Caesar = {};

function module.Caesar:Encrypt(text: string, n: number)
	text = string.lower(text);
	local output = "";
	local alphabet = "abcdefghijklmnopqrstuvwxyz";

	for i = 1, #text do
		if text:sub(i, i) == " " then
			output = output .. " "            
		elseif string.find(alphabet, text:sub(i, i)) == nil then
			output = output .. " "
		else
			local index = string.find(alphabet, text:sub(i, i));
			local newIndex = (index + n - 1) % 26 + 1;
			output = output .. alphabet:sub(newIndex, newIndex);
		end
	end

	return output;
end

function module.Caesar:Decrypt(text: string, n: number)
	text = string.lower(text);
	local output = "";
	local alphabet = "abcdefghijklmnopqrstuvwxyz";

	for i = 1, #text do
		if text:sub(i, i) == " " then
			output = output .. " "            
		elseif string.find(alphabet, text:sub(i, i)) == nil then
			output = output .. " "
		else
			local index = string.find(alphabet, text:sub(i, i));
			local newIndex = (index - n - 1) % 26 + 1;
			output = output .. alphabet:sub(newIndex, newIndex);
		end
	end

	return output;
end

function module.Caesar:Test()
	local text = "Testing my system";
	local n = 3;

	local result1 = module.Caesar:Encrypt(text, n)
	local result2 = module.Caesar:Decrypt(result1, n)

	print("Encrypting: ")
	print(text .. " -> " .. result1)
	print("Decrypting")
	print(result1 .. " -> " .. result2)
end

-- Testing
module.Caesar:Test()
