require 'sinatra'

File.open('tmp/test_web.pid', 'w') {|f| f.puts Process.pid }

post '/coffee' do
  "<div id='confirmation'>Here is your coffee - #{'strong' if params['strong']} #{params['coffee_type']} with #{params['num_sugars']} sugars #{params['extras']}</div>"
end


get '/' do
<<EOF
<html>
<head><title>hi there</title></head>
<body>
<form action="/coffee" method="post">
    <table border="0">
        <tr><td>Type</td>
            <td>
                <input type="radio" name="type" value="flat_white"/>flat white
                <input type="radio" name="type" value="latte"/>latte
            </td>
        </tr>
        <tr><td>Num Sugars</td>
            <td>
                <select name="num_sugars" id="num_sugars">
                    <option>0</option>
                    <option>1</option>
                    <option>2</option>
                </select>
            </td>
        </tr>
        <tr><td>Strong</td>
            <td>
                <input type="checkbox" name="strong"/>
            </td>
        </tr>
        <tr><td>Extras</td>
            <td>
                <input type="text" name="extras" id="coffee-extras"/>
            </td>
        </tr>
        <tr><td></td>
            <td>
                <input type="submit" id="make" name="make" value="make"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
EOF
end
