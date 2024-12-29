 # Usage

 ## Create instance

    // Create publisher
    pub = [];
    pub.add(ConsolePublisher());

    Logger logger = Logger('Name of Logger');



## Use GetIt

    // Create publisher
    pub = [];
    pub.add(ConsolePublisher());

    GetIt.instance.registerFactoryParam<Logger, String, dynamic>((param, _) => Logger(param!));

    var logger = GetIt.instance.get<Logger>(param1: 'loggerName');
