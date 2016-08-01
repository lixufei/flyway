# &lt;&lt;master flyway in 30 minutes&gt;&gt; session example

## How to setup
#### 1. Clone the repo to your local
#### 2. Run cd &lt;projectroot&gt;/src/db
#### 3. Run ./startH2 to start the database
#### 4. It will open a browser window for the database console
#### 5. Select Saved Settings with 'Generic H2(Server)', keep the others default.
#### 6. Click 'Connect' to connect to the database
#### 7. Run the sql script in &lt;projectroot&gt;/src/script/create_employee_table.sql to test if it works.
###

ls -al|grep h2
.6 command
.6 execution models
.popular databases

./gradlew flywayClean
flywayInfo
pending: flywayRepair
flywayMigrate
check:  flywayValidate
baseline

HOMEWORK:rollback to the last version not went PROD?

1.<数据库重构>
2.http://flywaydb.org

1.首先需要注意的一点就是数据库版本在文件目录存放的位置：
存放在：src/main/resources/db/migration/ 这样的一个目录：

2.数据库表版本的命名规则：V1__create_use_table.sql（第一个V大写，两个下划线）

3. 此时运行”gradle flywayInfo” 会出现此目录下数据库表的一些版本信息。
可以看到所有的数据库表的状态都是pending状态。

如果在此目录下之前的数据库表没有纳入flyway这个工具中，可以在`build.gradle文件中,加入baselineVersion=1`。这样当你运行“gradle flywayBaseLine”这条命令的时候，此时会发现第一个状态已经变为success。

4. “gradle flywayMigrate” 这一条命令，会自动运行你目录下的所有版本

5. “gradle flywayClean” 会清除数据库中所有表的记录

6. “gradle flywayValid” 验证数据库目录下的哪一个版本是没有运行的。

7.如果某一个版本有sql错误，此时当你执行“gradle flywayMigrate”会出现错误。而当执行“gradle flywayInfo”命令时，会看到此版本的状态为“failed”，而这个版本之后的状态都是pending状态。
此时可以运行“gradle flywayRepair”命令修改其为“pending”状态。【这里需要注意的是，一定得先修复为pending状态，再去修改错误的地方，接着执行’gradle flywayMigrate才可以成功’  如果直接修改代码，直接执行`gradle flywayMigrate你会发现仍然是有错误的。尽管你可以保证你的代码是正确地。`】


