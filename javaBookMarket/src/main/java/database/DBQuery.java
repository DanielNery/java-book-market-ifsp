package database;


import java.sql.ResultSet; 
import java.sql.SQLException;
import java.sql.Statement;

public class DBQuery {
	
	private Statement statement =  null;
	private String    tableName 	= "";
	private String[]  fieldsName 	= new String[]{};
	private String    fieldKey  	= "";
	private int		  keyFieldIndex = -1;
	
	
	public DBQuery() {
		try {
			this.statement = new DBConnection().getConnection().createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public String[] dontInjectionStrings(String[] values) {
		String[] tempValues = values;
		for (int i = 0; i < tempValues.length; i++) {
			
		}
		return null;
	}
	
	public DBQuery(	String tableName, String fieldsName,  String fieldKey) {
		this.setTableName	( tableName  );
		this.setFieldsName	( fieldsName );
		this.setFieldKey	( fieldKey   ); 
		try {
			this.statement = new DBConnection().getConnection().createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private int whereIsKeyField() {
		for ( int i =0; i < this.fieldsName.length; i ++ ){
			if( this.fieldsName[i].equals(this.fieldKey) ){
				return(i);
			}
		}
		return(-1);
	}
	
	public ResultSet query(String sql) { // select
		try {
			ResultSet rs = statement.executeQuery(sql);
			return (rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String joinElements (String[] elements, String separator ){
		String out = "";
		for (int i=0; i< elements.length; i++) {
			out +=  elements[i].trim() +  ((i == elements.length-1) ? "" : separator );
		}
		return (out);
	}
	
	public int execute(String sql) { // insert, delete, update
		try {
			int rs = statement.executeUpdate(sql);
			return (rs);
		}catch (SQLException e) {
			System.out.println("\nErro: Verifique o comando ou a dependencia de chave extrangeira!");
		}
		
		return 0;
	}

	public ResultSet select(String where) {
		String sql = "SELECT "+  this.joinElements(this.fieldsName, ", ") + " FROM " + this.tableName;
		sql += (( where!="") ? " WHERE "+ where : "" );
		System.out.print(sql);
		return this.query(sql);
	}
	
	public int insert(String[] values) {
		for (String value : values) {
			System.out.println(value);
		}
		if ( values.length == this.fieldsName.length){
			String sql = "INSERT INTO "+this.tableName+" ( "+  this.joinElements(this.fieldsName, ", ");
			sql += ") VALUES ('"+joinElements(values, "','")+"')";
			System.out.print(sql);
			return ( this.execute(sql));
		}else{
			System.out.print("O n�mero de valores informados n�o � equivalente aos campos da tabela!");
		}	
		return 0;
	}
	
	public int delete(String[] values) {
		if (values.length != this.fieldsName.length){
			System.out.println("\n A quantidade de campos � diferente da quantidade de valores!");
			return ( 0 );
		}
		
		String sql = "\nDELETE FROM "+this.tableName+" ";
		if ( this.keyFieldIndex < 0 ){
			return(0);
		}
		sql += "\n WHERE "+ this.fieldKey +" = '"+ values[this.keyFieldIndex] +"'";
		System.out.print( sql );
		return ( this.execute(sql) );
	}
	
	public int update(String[] values) {
		
		if (values.length != this.fieldsName.length){
			System.out.println("\n A quantidade de campos � diferente da quantidade de valores!");
			return ( 0 );
		}
		
		String sql = "\nUPDATE "+this.tableName+" SET ";
		for( int i=0; i <  values.length; i++){
			sql += "\n\t "+
				this.fieldsName[i] + " = '"+values[i].trim()+"'" 
				+  ((i == values.length-1) ? "" : ", ");
		}
		if ( this.keyFieldIndex < 0 ){
			return(0);
		}
		sql += "\n WHERE "+ this.fieldKey +" = '"+ values[this.keyFieldIndex] +"'";
		System.out.print( sql );
		return ( this.execute(sql) );
	}

	public String getTableName() {
		return tableName;
	}


	public void setTableName(String tableName) {
		this.tableName = tableName;
	}


	public String[] getFieldsName() {
		return fieldsName;
	}


	public void setFieldsName(String fieldsName) {
		this.fieldsName	= fieldsName.split(",");
		for (int i=0;  i< this.fieldsName.length; i++) {
			this.fieldsName[i] = this.fieldsName[i].trim();
		};
	}

	public String getFieldKey() {
		return fieldKey;
	}


	public void setFieldKey(String fieldKey) {
		this.fieldKey = fieldKey;
		this.keyFieldIndex = whereIsKeyField();

	}

	public int getKeyFieldIndex() {
		return keyFieldIndex;
	}

	public void setKeyFieldIndex(int keyFieldIndex) {
		this.keyFieldIndex = keyFieldIndex;
	}

}
