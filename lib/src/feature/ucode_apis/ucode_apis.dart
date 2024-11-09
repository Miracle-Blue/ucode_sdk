import '../../common/model/config.dart';
import '../auth/auth.dart';
import '../files/files.dart';
import '../functions/functions.dart';
import '../items/items.dart';

class UcodeApis {
  UcodeApis({required final Config config}) : _config = config;

  final Config _config;

  /// Returns the configuration object.
  Config get config => _config;

  /*
		Items returns an interface to interact with items within a specified collection.

		Items are objects within a Collection which contain values for one or more fields.
		Each item represents a record in your database, allowing CRUD operations.

		Usage:
		sdk.items("collection_name").
			create(data).
			exec()

		This enables you to manage items in collections across databases, such as MongoDB and PostgreSQL.
	*/
  Items items(String collection) => ItemsImpl(config: _config, collection: collection);
  /*
		Auth returns an interface for handling user authentication and authorization operations.

		Use this interface to manage user registration, login, password resets, and other
		authentication-related tasks.

		Usage:
		sdk.auth().
			register(data).
			exec()

		Supports various authentication workflows compatible with both MongoDB and PostgreSQL.
	*/
  IAuth auth() => AuthImpl(config: _config);
  /*
		Files returns an interface for file management operations.

		Use this interface to upload, delete, or manage files stored on the server, allowing
		for easy integration of file-based data alongside other operations.

		Usage:
		sdk.files().
			upload("file_path").
			exec()

		Designed for compatibility with both MongoDB and PostgreSQL for consistent file management.
	*/
  IFiles files() => FilesImpl(config: _config);
  /*
		Function returns an interface for invoking server-side functions.

		This interface enables the execution of predefined or custom server functions,
		facilitating complex data processing and automation workflows.

		Usage:
		sdk.function("function_path").
			invoke(data).
			exec()

		Supported across MongoDB and PostgreSQL, providing flexibility for backend processing.
	*/
  IFunctions function(String path) => FunctionsImpl(config: _config, path: path);
}
