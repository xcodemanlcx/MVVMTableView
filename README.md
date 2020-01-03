[TOC]

# MVVMTableView的组件工具

### 思路
* 解耦：UI与逻辑分离；
* 高复用性、高度自定义、可维护性强：组件功能单一职责化，尽量单层封层实现；
* 避免冲突：复用性强的类名与类的category（扩展属性或方法）加了前缀；
* 使用：简洁、解耦的一行代码；

## 一行代码：处理数据为空UI
* #import "NSObject+LCXDataNullViewHandle.h"：数据为空UI逻辑（结合了自定义UI）；
* #import "NSObject+LCXDataNull.h"：自定义UI逻辑；
* #import "LCXDataNullView.h"：自定义UI；

## 一行代码：处理无网络UI
* #import "NSObject+LCXNoNetWork.h"：无网络UI逻辑（结合了自定义UI）；
* #import "LCXNoNetworkView.h"：自定义UI逻辑；
* #import "LCXNoNetworkView.h"：自定义UI；

## 一行代码：实现MJRefresh的上拉加载，或下拉刷新,或加载更多-数组逻辑
* #import "UIScrollView+LCXRefresh.h"：实现MJRefresh的上拉加载，或下拉刷新
* #import "NSMutableArray+LCXHandleMoreData.h"：加载更多-数组逻辑

##  UITableView工具
### 一行代码：TableView初始化
* #import "LCXInitTableView.h"：函数式编程，代码简洁;但函数内部不能使用self，书写返回值和参数时基本无提示；
### 一行代码：TableView的复用Cell批量注册（无需命名复用cell的id）
#import "UITableView+LCXRegisterCellClasses.h"：扩展了UITableView的NSArray属性，作为自定义cell的key（即复用id）容器；而key是复用cell类名；
### 一行代码：TableView布局适配（使用masonry）
* #import "UIView+LCXMasonry.h"
### 一行代码：TableView的Cell响应事件处理
* #import "UITableView+LCXHandleActionCell.h"
### TableView的delegate分离（delegate的block写法）
* #import "LCXTableBlockDelegate.h"：delegate的block写法；

## UITableViewCell工具
* #import "LCXTableViewCell.h"：可作为自定义Cell的父类，处理自定义UI、刷新model方法、响应cell的点击事件非常方便,快速自定义Cell；

## UIView通用工具
#import "UIView+LCXActionBlock.h"：扩展block属性，方便回调；
#import "UIView+LCXRegisterClasses.h"：批量注册可复用的UIView类，比如UITableViewCell、UICollectionViewCell；
