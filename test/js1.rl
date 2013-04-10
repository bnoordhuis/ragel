/*
 * @LANG: js
 */

%%{
machine js1;

one := 'one\n';
two := 'two\n';
four := 'four\n';

main :=
	( 'hello' | 'there' | 'friend' )
	'\n' @{int s = fentry(one); fgoto *s; char c = fc;}
	( 'one' | 'two' | 'four' ) '\n';
}%%

%% write data;

function test( data )
{
	data = new Buffer( data );
	var cs, p = 0, pe = data.length;
	var top;

	%% write init;
	%% write exec;

	if ( cs >= js1_first_final )
		console.log( "ACCEPT" );
	else
		console.log( "FAIL" );
}

test( "hello\none\n" );
test( "there\ntwo\n" );
test( "friend\nfour\n" );

/* _____OUTPUT_____
ACCEPT
FAIL
FAIL
*/
